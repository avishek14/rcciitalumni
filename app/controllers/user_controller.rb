class UserController < ApplicationController
  def logger
  end

  def login
  end

  def logout
  end

  def register
  end

  def create
    dtime = DateTime.new params[:dob]['d(1i)'].to_i, params[:dob]['d(2i)'].to_i, params[:dob]['d(3i)'].to_i
    User.create fname: params[:fname], typeof: params[:typeof], lname: params[:lname], dob: dtime, email: params[:email], phone: params[:phone], 
      yearofpassing: params[:date][:year], department: params[:department], status: params[:status], inst: params[:inst], password: params[:password]
  end

  def page
  end

  def edit
  end

  def delete
  end
end
