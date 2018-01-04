require 'spec_helper'

describe RewardManager, '#grant_login_points' do
  let(:customer) { create(:customer) }

  specify 'DATE 2LOGIN USER 2P' do
    Time.zone = 'Tokyo'
    data_boundary = Time.zone.local(2017, 1, 1, 5, 0, 0)
    expect{
      Timecop.freeze(date_boundary.advance(seconds: -1))
      RewardManager.new(customer).grant_login_points
      Timecop.freeze(date_boundary)
      RewardManager.new(customre).grant_login_points
    }.to change { customer.points }.by(2)
  end

  specigy 'DATE NOT 2LOGIN USER 1P' do
    Time.zone = 'Tokyo'
    date_boundary = Time.zone.local(2017, 1, 1, 5, 0, 0)
    expect{
      Timecop.freeze(date_boundary)
      RewardManager.new(customer).grant_login_points
      Timecop.freeze(date_boundary.advance(hours: 24, seconds: -1))
      RewardManager.new(customer).grant_login_points
    }.to change { customer.points }.by(1)
  end
end

