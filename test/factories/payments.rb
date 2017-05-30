FactoryGirl.define do
  factory :payment do
    loan { build(:loan) }
    month 1
  end
end
