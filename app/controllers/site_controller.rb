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
end
