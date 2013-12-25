class AdminController < ApplicationController
  def user_all
    @u_all = User.all
  end

  def user_one
  end

  def user_delete
  end

  def gallery_upload
  end

  def upload_image
  end

  def event_create
  end

  def create_event
    dtime = DateTime.new params[:don]['d(1i)'].to_i, params[:don]['d(2i)'].to_i, params[:don]['d(3i)'].to_i

    Event.create date_on: dtime, title: params[:title], desc: params[:desc]

    return redirect_to event_event_all_path
  end

  def delete_event
    Event.find(params[:id]).delete
    return redirect_to event_event_all_path
  end
end
