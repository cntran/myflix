require 'pry'
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
    if User.exists?(session[:user_id])
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def logged_in?
    current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Must be logged in to perform action."
      redirect_to root_path
    end
  end

end
