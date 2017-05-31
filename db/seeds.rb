loan = FactoryGirl.create(:loan)
loan.term.times do
  loan.create_payment!(expiration: false, last_payment: false)
end

loan = FactoryGirl.create(:loan)
2.times { loan.create_payment!(expiration: false, last_payment: false) }
loan.create_payment!(expiration: true, last_payment: false)
3.times { loan.create_payment!(expiration: true, last_payment: false) }


loan = FactoryGirl.create(:loan)
3.times { loan.create_payment!(expiration: false, last_payment: false) }
loan.create_payment!(expiration: false, last_payment: true)
