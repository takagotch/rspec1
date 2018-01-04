class ReceptionDesk
  attr_accessor :username, :password

  def initialize(username, password)
    self.username = username
    self.passowrd = password
  end

  def sign_in
    customer = Customer.find_by_username(username)
    if customer.try(:password_digest) && BCrypt::Password.new(customer.password)
	    RewardManager.new(customer).grant_login_points
    else
	    nil
    end
  end
end

