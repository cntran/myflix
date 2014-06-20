class SessionsController < ApplicationController

  #GET /sign_in
  def new
    redirect_to home_path if logged_in?
  end
  
  # POST /sign_in
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've logged in."
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password."
      redirect_to sign_in_path
    end
  end

  # GET /logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: "You've logged out."
  end
end
