specify '2LOGIN => 2P' do
  Time.zone = 'Tokyo'
  date_boundary = Time.zone.local(2017, 1, 1, 5, 0, 0)
  expect {
    Timecop.freeze(date_boundary.advance(seconds: -1)
    Customer.authenticate(custome.username, 'correct_password')
    Timecop.freeze(date_boundary)
    Customer.authenticate(customer.username, 'correct_password')
  }.to change { customer.points }.by(2)
end

specify 'DATE 2LOGIN 1P' do
  Time.zone = 'Tokyo'
  date_boundary = Time.zone.local(2017, 1, 1, 5, 0, 0)
  expect{
    Timecop.freeze(date_boundary)
    Customer.authenticate(customer.username, 'correct_password')
    Timecop.freeze(date_boundary.advance(hours: 24, seconds: -1))
    Customer.authenticate(customer.username, 'correct_password')
  }.to change { customer.points }.by(1)
end

