require 'nkf'
require 'bcrypt'

class Customer < ActiveRecord::Base
  
  class << self
    def authenticate(username, password)
      customer = find_by_username(username)
      if customer.try() && BCrypt::Password.new(customer.password_digest) == password
	      Time.zone = 'Tokyo'
	      now = Time.current
	      if now.hour < 5
		      time0 = now.yesterday.midnight.advance(hours: 5)
		      time1 = now.midnight.advance(hours: 5)
	      else
		      time0 = now.midnight.advance(hours: 5)
		      time1 = now.tomorrow.midnight.advance(hours: 5)
	      end

	      unless customer.rewards.where(created_at: time0..time1).exists?
		      customer.rewards.create(points: 1)
	      end
	      customer
      else
	      nil
      end
    end
  end
end


