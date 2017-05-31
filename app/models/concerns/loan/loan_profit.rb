class Loan < ApplicationRecord
  module LoanProfit
    extend ActiveSupport::Concern

    included do
      class << self
        def year_income_profit_real
          already_paied = all.reject(&:can_make_more_payments?)
          return 0 if already_paied.blank?
          already_paied.map(&:year_income_profit).sum / already_paied.count
        end

        def year_income_profit_optimistic
          Loan::YEAR_BASE_RATE
        end
      end
    end
  end
end
