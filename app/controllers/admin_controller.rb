class AdminController < ApplicationController
  def user_all
    unless is_admin?
      return redirect_to root_path
    end

    @u_all = User.all.order('active').order('fname').page(params[:page]).per(18)

    set_title 'Admin | Users'
  end

  def user_one
    unless is_admin?
      return redirect_to root_path
    end

  end

  def user_toggle
    unless is_admin?
      return redirect_to root_path
    end

    user = User.find params[:id]
    user.update_attribute :active, !user.active

    flash[:message] = "User state toggled. User active state is = #{user.active}"
    if user.active
      AdminMailer.user_active(user).deliver
    else
      AdminMailer.user_deactive(user).deliver
    end
    
    return redirect_to user_page_path( id: user.id )
  end

  def user_delete
    unless is_admin?
      return redirect_to root_path
    end

    user = User.find params[:id]
    user.destroy

    return redirect_to admin_user_all_path
  end

  def gallery_upload
    unless is_admin?
      return redirect_to root_path
    end

    set_title 'Upload to Gallery'
  end

  def upload_image
    unless is_admin?
      return redirect_to root_path
    end

    if params[:gallery_image] === "" or params[:caption] === "" or params[:desc] === ""
      flash[:error] = "All fields must be filled in."
      return redirect_to admin_gallery_upload_path
    end

    GalleryImages.create gallery_image: params[:gallery_image], caption: params[:caption], desc: params[:desc]
    return redirect_to gallery_gallery_path
  end

  def delete_image
    unless is_admin?
      return redirect_to root_path
    end

    gali = GalleryImages.find(params[:id])
    gali.delete
    return redirect_to gallery_gallery_path
  end

  def event_create
    unless is_admin?
      return redirect_to root_path
    end

    set_title "New Event"
  end

  def create_event
    unless is_admin?
      return redirect_to root_path
    end

    if params[:title] === "" or params[:desc] === ""
      flash[:error] = "All fields must be filled in."
      return redirect_to admin_event_create_path
    end

    dtime = DateTime.new params[:don]['d(1i)'].to_i, params[:don]['d(2i)'].to_i, params[:don]['d(3i)'].to_i

    Event.create date_on: dtime, title: params[:title], desc: params[:desc]

    return redirect_to event_event_all_path
  end

  def delete_event
    unless is_admin?
      return redirect_to root_path
    end

    Event.find(params[:id]).delete
    return redirect_to event_event_all_path
  end

  def check_feedback
    unless is_admin?
      return redirect_to root_path
    end

    @feedbacks = Feedback.all
  end

  def one_feedback
    unless is_admin?
      return redirect_to root_path
    end

    @feedback = Feedback.find(params[:id])
  end

  def delete_feedback
    unless is_admin?
      return redirect_to root_path
    end

    @feedback = Feedback.find(params[:id])
    @feedback.delete

    return redirect_to admin_check_feedback_path
  end
end
