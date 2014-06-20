require 'spec_helper'

describe ReviewsController do

  describe "POST create" do

    context "with authenticated user" do

      let(:video) { Fabricate(:video) }
      let(:user) { Fabricate(:user) }

      before do
        session[:user_id] = user.id
      end

      context "with valid input" do

        let(:review_hash) { Fabricate.attributes_for(:review) }

        before do
          post :create, video_id: video.id, review: review_hash
        end

        it "creates a review with" do
          expect(Review.count).to eq(1)
        end

        it "creates a review associated with video" do
          expect(Review.first.video).to eq(video)      
        end

        it "creates a review associated with current user" do
          expect(Review.first.user).to eq(user)      
        end

        it "redirects to the video path" do
          expect(response).to redirect_to video_path(video)
        end

      end

      context "with invalid input" do
        
        let(:review_hash) { Fabricate.attributes_for(:review, content: '') }

        before do
          post :create, video_id: video.id, review: review_hash
        end

        it "renders the video template" do
          expect(response).to render_template 'videos/show'
        end

      end

    end

    context "with unauthenticated user" do

      it "redirects to root path" do
        video = Fabricate(:video)
        review_hash = Fabricate.attributes_for(:review)
        post :create, video_id: video.id, review: review_hash
        expect(response).to redirect_to root_path
      end

    end


  end


end
