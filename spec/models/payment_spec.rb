require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "#validates" do
    subject(:payment) { build(:payment, loan: create(:loan)) }
    it { should belong_to(:loan) }
    it { should validate_presence_of(:month) }
    it { should validate_inclusion_of(:month).in_range(1..payment.loan_term) }
  end

  describe "payments" do
    context "can cre" do
      # let!(:loan) { create(:loan) }
      #
      # it 'have valid amount' do
      #
      #   expect()
      # end

    end
  end
end
