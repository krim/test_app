class Payment < ApplicationRecord
  belongs_to :loan

  delegate :term, to: :loan, prefix: true, allow_nil: false

  validates :loan, :month, presence: true
  validates :month, inclusion: { in: ->(payment) { 1..payment.loan_term } }

  def amount
    if last_payment? && expiration?
      loan.last_expiration_payment
    elsif last_payment?
      loan.last_pay
    elsif expiration?
      loan.expiration_pay
    else
      loan.period_pay
    end
  end
end
