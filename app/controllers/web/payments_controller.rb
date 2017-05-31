class Web::PaymentsController < ApplicationController
  before_action :loan

  def create
    @payment = @loan.create_payment!(**payment_params)
  end

  private

  def payment_params
    params.require(:payment).permit(:expiration, :last_payment).to_h.symbolize_keys
  end

  def loan
    @loan = Loan.find(params[:loan_id])
  end
end
