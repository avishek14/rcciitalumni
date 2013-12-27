class SiteController < ApplicationController
  def home
  	@events = Event.all

    set_title 'Welcome'
  end

  def contact

    set_title 'Contact'
  end

  def pdesk

    set_title "Principal's Desk"
  end

  def feedback

    set_title 'Feedback Form'
  end

  def send_feedback
  	AdminMailer.feedback( params[:name], params[:email], params[:subject], params[:body]).deliver
  	return redirect_to root_path
  end
end
