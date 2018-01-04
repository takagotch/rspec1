require 'nkf'
require 'bcrypt'

class Customer < ActiveRecord::Base
  has_many :rewards

  attr_accessor :password

  def points
    rewards.sum(:points)
  end

  class << self
    def authenticate(username, password)
      customer = find_by_username(username)
     #if customer.try(:password_digest) && BCrypt::Password.new(customer.password_digest) == password
	     customer.rewards.create(points: 1)
	     custmer
      else
	      nil
    end
  end
end

