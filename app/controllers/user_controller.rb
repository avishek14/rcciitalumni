class UserController < ApplicationController
  def logger
    set_title 'Login'
  end

  def login
    user = User.find_by_email params[:email]

    if !user
      flash[:error] = "Email does not exist."
      return redirect_to user_logger_path
    elsif !user.authenticate params[:password]
      flash[:error] = "Password incorrect."
      return redirect_to user_logger_path
    elsif !user.active
      flash[:error] = "User account not yet active. Wait twenty-four hours or contact admin."
      return redirect_to user_logger_path
    end

    cookies[:auth_token] = user.auth_token

    flash[:message] = "User #{user.fname} #{user.lname} successfully logged in."
    redirect_to root_path
  end

  def logout
    cookies.delete :auth_token
    redirect_to root_path
  end

  def register
    set_title 'Register'
    @departments = Department.all
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
    @newUser = User.new typeof: params[:typeof], fname: params[:fname], lname: params[:lname], dob: dtime, 
      email: params[:email], phone: params[:phone], department: Department.find(params[:department]).name,
      department_id: params[:department], password: params[:password]

    @newUser.image = params[:image]

    if params[:typeof] === 'Alumni'
      @newUser.status = params[:status] if params[:status]
      @newUser.inst = params[:inst] if params[:inst]
      @newUser.yearofpassing = params[:date][:year]
      @newUser.posit = params[:posit] if params[:posit]
    elsif params[:typeof] === 'Teacher'
      @newUser.posit = params[:posit]
    elsif params[:typeof] === 'Student'
      @newUser.yearofpassing = params[:date][:year]
    end

    if params[:email] === 'admin@rcciita.com'
      @newUser.active = true
    else
      @newUser.active = false
    end

    unless @newUser.valid?
      flash[:error] = "Something has gone wrong. Check the format of your image."
      return redirect_to user_register_path
    end
    
    @newUser.save
  end

  def page
    unless current_user
      return redirect_to root_path
    end

    @cu = User.find params[:id]

    set_title "#{@cu.fname} #{@cu.lname}"
  end

  def check_pm
    unless current_user
      return redirect_to root_path
    end

    set_title 'P.M.'

    @pms = Pm.where(to: current_user.id).order(seen: :desc, created_at: :desc).page(params[:page]).per(10)
  end

  def check_one_pm
    unless current_user and Pm.find(params[:id]).to === current_user.id
      return redirect_to root_path
    end

    @pm = Pm.find params[:id]

    @pm.update_attribute :seen, true
    set_title "#{@pm.subject}"
  end

  def pm
    unless current_user
      return redirect_to root_path
    end

    set_title 'Send P.M.'

    @cu = User.find params[:id]
    @subject = ""
    @subject = params[:subject] if params[:subject]
  end

  def send_pm
    unless current_user
      return redirect_to root_path
    end

    user = User.find params[:receiver]

    if user and Pm.where(to: user.id).count < 5
      Pm.create subject: params[:subject], body: params[:body], to: user.id, from: current_user.id
      flash[:message] = "PM Sent."
      return redirect_to user_page_path(id: params[:receiver])
    end
      
    flash[:message] = "User's inbox is full."
    return redirect_to user_page_path(id: params[:receiver])
  end

  def delete_pm
    unless current_user
      return redirect_to root_path
    end

    @pm = Pm.find params[:id]

    unless @pm.to === current_user.id
      return redirect_to user_check_pm_path
    end

    @pm.delete

    return redirect_to user_check_pm_path
  end

  def edit
    set_title 'Edit Account Details'
  end

  def commit_edit
    unless params[:image] === ""
      current_user.update_attribute :image, params[:image]
    end

    unless current_user.email === params[:email]
      if User.find_by_email params[:email]
        flash[:error] = "Email already exists."
        return redirect_to user_edit_path
      end
    end

    current_user.update_attributes email: params[:email], phone: params[:phone]

    if current_user.typeof === "Alumni"
      current_user.update_attributes status: params[:status], inst: params[:inst]
    end

    return redirect_to user_page_path(id: current_user.id)
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
