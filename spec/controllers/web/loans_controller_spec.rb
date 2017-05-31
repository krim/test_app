require 'rails_helper'

RSpec.describe Web::LoansController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    render_views
    let(:loan) { create(:loan) }
    it "returns http success" do
      get :show, params: { id: loan.id }
      expect(response).to have_http_status(:success)
      expect(response.body).to have_content(loan.title)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, params: { loan: { title: 'Company', amount: 1_000_000 } }, xhr: true
      expect(response).to have_http_status(:success)
      loan = Loan.last
      expect(loan.title).to eq('Company')
      expect(loan.amount).to eq(1_000_000)
    end
  end
end
