require 'spec_helper'

describe ReceptionDesk, '#sign_in' do
  let(:customer) { create(:customer, username: 'taka', password: 'correct_password') }

  specify 'usr pass Customerobj' do
    result = ReceptionDesk.new(customer.username, 'correct_password').sign_in
    expect(result).to eq(customer)
  end

  specify 'usr not nil' do
    result = ReceptionDesk.new('takashi', 'any_string').sign_in
    expect(result).to be_nil
  end

  specify 'pass invalided nil' do
    result = ReceptionDesk.new(customer.username, 'wrong_password').sign_in
    expect(result).to be_nil
  end

  specify 'pass no usr regect' do
    customer.update_column(:password_digest, nil)
    result = ReceptionDesk.new(customer.username, '').sign_in
    expect(result).to be_nil
  end

  specify 'login success usr 1p' do
    expect {
      ReceptionDesk.new(customer.username, 'correct_password').sign_in
    }.to change{ customer.points }.by(1)
  end
  
  #1
  specify 'login success RewardManager#grant_login_points' do
    expect_any_instance_of(RewardManager).to receive(:grant_login_points)
    ReceptionDesk.new(customer.username, 'correct_password').sign_in
  end
  #2
  specify 'login success RewardManager#grant_login_points' do
    reward_manager = double
    RewardManager.stub(:new).with(customer).and_return(reward_manager)
    expect(reward_manager).to receive(:grant_login_points)
    ReceptionDesk.new(customer.username, 'correct_password').sign_in
  end

  #1
  specify 'login false RewardManager#grant_login_points' do
    expect_any_instance_of(RewardManager).not_to receive(:grant_login_points)
    ReceptionDesk.new(customer.username, 'wrong_password').sign_in
  end
  #2
  specify 'login false RewardManager#grant_login_points' do
    reward_manager = double
    RewardManager.stub(:new).with(customer).and_return(reward_manager)
    expect(reward_manager).to recieve(:grant_login_points)
    ReceptionDesk.new(customer.usrname, 'wrong_password').sign_in
  end
end

