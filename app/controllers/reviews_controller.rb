class ReviewsController < ApplicationController
  
  before_filter :require_user

  def create
    
    @video = Video.find params[:video_id]
    @review = Review.new(review_params) 
    @review.video = @video
    @review.user = current_user

    if @review.save
      flash[:success] = "Successfully created review."
      redirect_to video_path(@video)   
    else
      flash[:danger] = "Please write something for your review."
      render 'videos/show'
    end
    
  end

  def review_params
    params.require(:review).permit!
  end

end
