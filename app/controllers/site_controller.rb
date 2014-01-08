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

    Feedback.create name: params[:name], email: params[:email], subject: params[:subject], body: params[:body]
    flash[:message] = "Your feedback has been submitted."
  	return redirect_to root_path
  end
end
