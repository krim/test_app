class Loan
  module LoanBasic
    extend ActiveSupport::Concern

    included do
      def basic_period_pay
        BigDecimal(amount / term)
      end

      def basic_expiration_pay
        BigDecimal(amount * percentage(expiration_rate) / Loan::MONTHS_IN_YEAR)
      end

      def rate_period_pay
        BigDecimal(amount * percentage(year_rate) / Loan::MONTHS_IN_YEAR)
      end

      def period_pay
        basic_period_pay + rate_period_pay
      end

      def end_amount
        period_pay * term
      end

      def rate_payed
        rate_period_pay * term
      end
    end
  end
end
