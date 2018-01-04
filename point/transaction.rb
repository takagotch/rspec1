require 'spec_helper'

describe RewardManager, '#grant_login_points' do
  let(:customer) { create(:customer) }
  let(:date_boundary) { Time.zone.local(2017, 1, 1, 5, 0, 0) }

  before { Time.zone = 'Tokyo' }

  specify 'Saturday AM5 login 1P' do
    Timecop.freeze(Time.zone.local(2017, 1, 5, 4, 59, 59))
    expect {
      RewardManager.new(customer).grant_login_points
    }.to change { customer.points }.by(1)
  end

  specify 'Saturday AM5 login 3P' do
    Timecop.freeze(Time.zone.local(2017, 1, 5, 5, 0, 0))
    expect {
      RewardManager.new(customer).grant_login_points
    }.to change { customer.points }.by(3)
  end

  specify 'Sunday AM5 login 3P' do
    Timecop.freeze(Time.zone.local(2017, 1, 6, 4, 59, 59))
    expect{
      RewardManager.new(customer).grant_login_points
    }.to change { customer.points }by(3)
  end

  specify 'Sunday AM5 login 1P' do
    Timecop.freeze(Time.zone.local(2017, 1, 6, 5, 0, 0))
    expect{
      RewardManager.new(customer).grant_login_points
    }.to change { customer.points }.by(1)
  end

  specify 'DATE 2login Reward2' do
    expect{
      Timecop.freeze(date_boundary.advance(seconds: -1))
      RewardManager.new(customer).grant_login_points
      Timecop.freeze(date_boundary)
      RewardManager.new(customer).grant_login_points
    }.to change { customer.rewards.size }.by(2)
  end

  specify 'DATE no 2login Reward1' do
    expect {
      Timecop.freeze(date_boundary)
      RewardManager.new(customer).grant_login_points
      Timecop.freeze(date_boundary.advance(hours: 24, seconds: -1))
      RewardManager.new(customer).grant_login_points
    }..to change { customer.rewards.size }.by(1)
  end
end


def grant_login_pints
  Time.zone = 'Tokyo'
  now = Time.current
  if now.hour < 5
    time0 = now.yesterday.midnight.advance(hours: 5)
    time1 = now.midnight.advance(hours: 5)
  else
    time0 = now.midnight.advance(hours: 5)
    time1 = now.tomorrow.midnight.advance(hours: 5)
  end

  unless customer.rewards.where(created_at: time0...time1).exists?
    customer.rewards.create(points: 1)
    customer.rewards.create(points: 2) if time0.wday == 6
  end
end

