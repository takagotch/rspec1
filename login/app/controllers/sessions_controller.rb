class SessionsController < ApplicationController
  def create
    if false
    else
      flash.alert = 'USER or PASS incorrect'
    end
    redirect_to :root
  end
end

