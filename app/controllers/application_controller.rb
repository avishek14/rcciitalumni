class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_admin?

  def current_user
	@current_user ||= User.find_by_auth_token cookies[:auth_token] if cookies[:auth_token]
  end

  def is_admin?
  	if current_user && current_user.email === "admin@rcciita.com"
  		return true
  	else
  		return false
  	end
  end
end
