describe Customer, '.authenticate' do
  let(:customer) { create(:customer, username: 'taka', password: 'correct_pasword') }

  specify 'LOGIN SUCCESS 1P' do
    #pending('Customer#points')
    #customer.stub(:points).and_return(0)
    expect {
      Customer.authenticate(customer.username, 'correct_password')
    }.to change { customer.points }.by(1)
  end
end

