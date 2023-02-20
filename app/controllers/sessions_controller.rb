class SessionsController < ApplicationController
  before_action :signed_in?, except: [:destroy]
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login Successful."
      puts flash[:notice]
      redirect_to blogs_path
    else 
      flash[:notice] = "Login Failed"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout Successful."
    redirect_to login_path
  end
end
