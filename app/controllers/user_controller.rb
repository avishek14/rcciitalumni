class UserController < ApplicationController
  def logger
  end

  def login
    user = User.find_by_email params[:email]

    if !user
      flash[:error] = "Email does not exist."
      return redirect_to user_logger_path
    elsif !user.authenticate params[:password]
      flash[:error] = "Password incorrect."
      return redirect_to user_logger_path
    end

    cookies[:auth_token] = user.auth_token
    redirect_to root_path
  end

  def logout
    cookies.delete :auth_token
    redirect_to root_path
  end

  def register
  end

  def create
    if params[:email] === "" || params[:password] === ""
      flash[:error] = "Email or password missing."
      return redirect_to user_register_path
    elsif User.find_by_email params[:email]
      flash[:error] = "Email already exists."
      return redirect_to user_register_path
    end

    dtime = DateTime.new params[:dob]['d(1i)'].to_i, params[:dob]['d(2i)'].to_i, params[:dob]['d(3i)'].to_i
    newUser = User.new typeof: params[:typeof], fname: params[:fname], lname: params[:lname], dob: dtime, 
      email: params[:email], phone: params[:phone], department: params[:department], password: params[:password]

    newUser.image = params[:image]

    if params[:typeof] === 'Alumni'
      newUser.status = params[:status] if params[:status]
      newUser.inst = params[:inst] if params[:inst]
      newUser.yearofpassing = params[:date][:year]
    elsif params[:typeof] === 'Teacher'
      newUser.posit = params[:posit]
    elsif params[:typeof] === 'Student'
      newUser.yearofpassing = params[:date][:year]
    end

    newUser.save

    redirect_to root_path  
  end

  def page
    unless current_user
      return redirect_to root_path
    end

    @cu = current_user
  end

  def edit
  end

  def delete
    unless current_user
      return redirect_to root_path
    end

    cur = current_user
    cur.destroy
    cookies.delete :auth_token
    redirect_to root_path
  end
end
