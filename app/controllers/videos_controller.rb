class VideosController < ApplicationController
  before_filter :require_user

  def index
    if !logged_in?
      flash[:danger] = "Access reserved for members only. Please sign in first."
      redirect_to sign_in_path
    end
    @categories = Category.all
  end

  def show
    @video = Video.find params[:id]
    @reviews = @video.reviews
  end

  def search
    @videos = Video.search_by_title params[:search_term]
  end
end
