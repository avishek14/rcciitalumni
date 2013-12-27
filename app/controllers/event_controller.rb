class EventController < ApplicationController
  def event_all
  	@e_all = Event.all

  	set_title 'Events'
  end

  def event_one
  	@e_one = Event.find params[:id]

  	set_title @e_one.title
  end
end
