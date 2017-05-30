FactoryGirl.define do
  factory :loan do
    title { Faker::Company.name }
    amount { 1_000_000 }
    term 6
    period 1
    year_rate 30
    expiration_rate 50
  end
end
