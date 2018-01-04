describe Customer, '#points' do
  let(:customer) { create(:customer, username: 'taka') }

  specify 'relationship Reward point sum =>' do
    customer.rewards.create(points: 1)
    customer.rewards.create(points: 5)
    customer.rewards.create(points: -2)

    expect(customer.points).to eq(4)
  end
end

