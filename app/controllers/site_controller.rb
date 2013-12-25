class SiteController < ApplicationController
  def home
  	@events = Event.all
  end

  def contact
  end

  def pdesk
  end

  def feedback
  end

  def send_feedback
  	AdminMailer.feedback( params[:name], params[:email], params[:subject], params[:body]).deliver
  	return redirect_to root_path
  end
end
