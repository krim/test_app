require 'rails_helper'

RSpec.describe Web::PaymentsController, type: :controller do
  describe "GET #create" do
    let(:loan) { create(:loan) }
    it "returns http success" do
      post :create, params: { loan_id: loan.id, payment: { expiration: true, last_payment: true } }, xhr: true
      expect(response).to have_http_status(:success)
      payment = loan.payments.last
      expect(payment.expiration).to be(true)
      expect(payment.last_payment).to be(true)
    end
  end
end
