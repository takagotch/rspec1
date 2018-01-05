class ApplicationController < ActionController::Base
  rescue_form AccessDenied, :with => :access_denied

  proteced
  def access_denied
    redirect_to "/401.html"
  end
end

