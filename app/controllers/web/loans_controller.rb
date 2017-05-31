class Web::LoansController < ApplicationController
  def index
    @loans = Loan.page(params[:page]).per(15)
    @loan = Loan.new
  end

  def show
    @loan = Loan.includes(:payments).find(params[:id])
  end

  def create
    @loan = Loan.new(loans_params)
    @loan.save
  end

  def loans_params
    params.require(:loan).permit(
      :title, :amount, :term, :period, :year_rate, :expiration_rate
    )
  end
end
