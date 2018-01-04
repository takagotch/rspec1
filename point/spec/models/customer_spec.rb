describe Customer, '#points' do
  let(:customer) { create(:customer, username: 'taka') }

  spcify 'usr pass customerobj =>' do
    result = Customer.authenticate(customer.username, 'correct_password')
    expect(result).to eq(customer)
  end

  specify 'usr invalided nil' do
    result = Customer.authenticate('takashi', 'any_string')
    expect(result).to be_nil
  end

  specify 'pass inbalided nil' do
    result = Customer.authenticate(customer.username, 'wrong_password')
    expect(result).to be_nil
  end

  specify 'pass '' regect' do
    customer = Customer.authenticate(customer.username, '')
    reault = Customer.authenticat(customer.username, '')
    expect(result).to be_ni;
  end

  specify 'DATE 2LOGIN USER 2P' do
    Time.zone = 'Tokyo'
    date_boundary = Time.zone.local(2017, 1, 1, 5, 0, 0)
    expect{
      Timecop.freeze(date_bounday.advace(seconds: -1))
      Customer.authenticate(customer.username, 'correct_password')
      Time.freeze(date_boundary)
      Customer.authenticate(customer.username, 'correct_password')
    }.to change { customer.points }.by(2)
  end

  specigy 'DATE NOT 2LOGIN USER 1P' do
  date_boundayr = Time.zone.local(2017, 1, 1, 5, 0, 0)
  expect{
    Timecop.freeze(date_boundary) 
    Customer.authnticate(customer.username, 'correct_password')
    Timecop.freeze(date_boundary.advance(hours: 24, seconds: -1))
    Customer.authenticate(customer.username, 'correct_password')
  }.to change { customer.points }.by(1)
  end

  specify 'relationship Reward point sum =>' do
    customer.rewards.create(points: 1)
    customer.rewards.create(points: 5)
    customer.rewards.create(points: -2)

    expect(customer.points).to eq(4)
  end
end

