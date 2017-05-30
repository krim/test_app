require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe "#validates" do
    %i[title amount term period year_rate expiration_rate].each do |column|
      it { should validate_presence_of(column) }
    end

    %i[term period year_rate expiration_rate].each do |column|
      it { should validate_numericality_of(column).is_greater_than(0).only_integer }
    end

    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end

  describe "#basic" do
    subject(:loan) { build(:loan) }

    it "should have valid basic_period_pay" do
      expect(subject.basic_period_pay.round(4)).to eq(166_666.6667)
    end
    it "should have valid rate_period_pay" do
      expect(subject.rate_period_pay.to_f.round(4)).to eq(25_000.0)
    end
    it "should have valid period_pay" do
      expect(subject.period_pay.to_f.to_f.round(4)).to eq(191_666.6667)
    end
    it "should have valid end_amount" do
      expect(subject.end_amount.to_f.round(4)).to eq(1_150_000.0)
    end
    it "should have valid rate_payed" do
      expect(subject.rate_payed.to_f.round(4)).to eq(150_000.0)
    end
  end

  describe "#payments" do
    subject(:loan) { create(:loan) }

    it 'can create payments' do
      6.times do |i|
        expect { loan.create_payment!(expiration: false, last_payment: false) }.to change { loan.payments.count }.from(i).to(i + 1)
      end

      expect(loan.create_payment!).to be(false)
    end

    it 'can calculate payments' do
      6.times do
        payment = loan.create_payment!(expiration: false, last_payment: false)
        expect(payment.amount.to_f.round(2)).to eq(191_666.67)
      end

      expect(loan.year_income_profit.to_f).to eq(30)
    end

    it 'can calculate expiration payment' do
      2.times { loan.create_payment!(expiration: false, last_payment: false) }
      payment = loan.create_payment!(expiration: true, last_payment: false)
      expect(payment.amount.to_f.round(2)).to eq(208_333.33)

      3.times { loan.create_payment!(expiration: true, last_payment: false) }
      expect(loan.year_income_profit.to_f).to eq(43)
    end

    it 'can calculate last payment' do
      3.times { loan.create_payment!(expiration: false, last_payment: false) }
      payment = loan.create_payment!(expiration: false, last_payment: true)
      expect(payment.amount.to_f.round(2)).to eq(525_000.0)
      expect(loan.year_income_profit.to_f).to eq(20)
    end
  end
end
