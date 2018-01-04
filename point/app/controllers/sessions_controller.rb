class SessionsController < ApplicationController
  def create
    if customer = ReceptionDesk.new(params[:username], params[:password]).sign_in
	    session[:customer_id] = customer.id
    else
	    flash.alert = 'usr pass invalided'
    end
    redirect_to :root
  end
end

