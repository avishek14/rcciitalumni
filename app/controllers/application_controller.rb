class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_admin?, :set_title, :txtl

  def current_user
	@current_user ||= User.find_by_auth_token cookies[:auth_token] if cookies[:auth_token]
  end

  def is_admin?
  	if current_user && (current_user.email === "avishekga@gmail.com" || current_user.email === "admin@rcciitalumni.in")
  		return true
  	else
  		return false
  	end
  end

  def set_title title
    @title_field = title
  end

  def txtl the_text
    RedCloth.new(the_text).to_html.html_safe
  end
end
