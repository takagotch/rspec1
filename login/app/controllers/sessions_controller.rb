class SessionsController < ApplicationController
  def create
    #if false
    if customer = Customer.authenticate(params[:username], params[:password])
      p customer #debug
      session[:customer_id] = customer.id
    else
      flash.alert = 'USER or PASS incorrect'
    end
    redirect_to :root
  end
end

