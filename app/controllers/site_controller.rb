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
    if params[:name] === "" or params[:email] === "" or params[:subject] === "" or params[:body] === ""
      flash[:error] = "All fields marked with a red asterix must be filled."
      return redirect_to site_feedback_path
    end

  	AdminMailer.feedback( params[:name], params[:email], params[:subject], params[:body]).deliver
  	return redirect_to root_path
  end
end
