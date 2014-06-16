class UsersController < ApplicationController

  def new
    redirect_to home_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully registered."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit!
  end

end
