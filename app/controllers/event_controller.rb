class EventController < ApplicationController
  def event_all
  	@e_all = Event.all
  end

  def event_one
  	@e_one = Event.find params[:id]
  end
end
