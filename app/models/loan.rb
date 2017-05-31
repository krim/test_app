class Loan < ApplicationRecord
  MONTHS_IN_YEAR = 12
  include Loan::LoanBasic

  has_many :payments, dependent: :destroy

  validates :title, :amount, :term, :period, :year_rate, :expiration_rate,
            presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :term, :period, :year_rate, :expiration_rate,
            numericality: { greater_than: 0, only_integer: true }
  validates :period, inclusion: { in: 1..12 }

  def year_income_profit
    (rate_paid / amount * MONTHS_IN_YEAR / term * 100).to_i
  end

  def fully_paid?
    payments.where(last_payment: true).any?
  end

  def create_payment!(expiration: false, last_payment: false)
    return false unless can_make_more_payments?
    payments.create!(month: next_payment_month, expiration: expiration, last_payment: last_payment)
  end

  def can_make_more_payments?
    !fully_paid? && next_payment_month <= term
  end

  def expiration_pay
    basic_period_pay + basic_expiration_pay
  end

  def last_pay
    amount - basic_period_pay * payments_count + rate_period_pay
  end

  def rate_paid
    payments.map(&:amount).sum - amount
  end

  def last_expiration_payment
    amount - basic_period_pay * payments_count + basic_expiration_pay
  end

  def payments_count
    current_payments_count = payments.count - 1
    current_payments_count.positive? ? current_payments_count : 0
  end

  private

  def percentage(value)
    value / 100.0
  end

  def next_payment_month
    payments.maximum(:month).to_i + 1
  end
end
