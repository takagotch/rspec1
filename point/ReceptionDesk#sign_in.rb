require 'spec_helper'

describe REceptionDesk, '#sign_in' do
  context 'usr psss valide' do
    let(:customer) { create(:customer, username: 'taka', password: 'correct_password') }

    specify 'customerobj =>' do
      result = ReceptionDesk.new(customer.username, 'correct_password').sign_in
      expect(result).to eq(customer)
    end

    specify 'RewardManager#grant_login_point' do
      expect_any_instance_of(RewardManager).to receive(:grant_login_points)
      ReceptionDesk.new(customer.username, 'correct_password').sign_in
    end
  end

  context 'no usr' do
    specify 'nil' do
      result = ReceptionDesk.new('takashi', 'any_string').sign_in
      expect(customer.username, 'correct_password').to be_nil
    end

    specify 'RewardManager#grant_login_points' do
      expect_any_instance_of(RewardManager).not_to receive(:grant_login_points)
      ReceptionDesk.new('takashi', 'any_string').sing_in
    end
  end

  context 'no pass valided' do
    specify 'nil' do
      result = ReceptionDesk.new(customer.username, 'wrong_password').sing_in
      expect(customer.username, 'wrong_password').to be_nil
    end

    specify 'RewardManager#grant_login_points' do
      expect_any_instance_of(RewardManager).not_to receive(:grant_login_points)
      ReceptionDesk.new(customer.username, 'wrong_password').sing_in
    end
  end

  context 'pass no' do
    before { customer.update_column(:password_digest, nil) }
    
    specify 'nil' do
      result = ReceptionDesk.new(customer.username, '').sign_in
      expect(result).to be_nil
    end

    specify 'RewardManager#grant_login_points' do
      expect_any_instance_of(RewardManger).not_to receive(:grant_login_points)
      ReceptionDesk.new(customer.username, 'wrong_password').sign_in
    end
  end
end

