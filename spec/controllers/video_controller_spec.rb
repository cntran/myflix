require 'spec_helper'

describe VideosController do

  describe "GET show" do

    it "sets the @video variable for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "sets the @reviews variable for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      review1 = Fabricate(:review, video: video)
      review2 = Fabricate(:review, video: video)
      get :show, id: video.id
      expect(assigns(:reviews)).to eq([review2, review1])
    end

    it "renders the show template for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to render_template :show
    end
   
    it "redirects to root path for unauthenticated user" do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to root_path
    end

  end

  describe "GET search" do
    
    it "sets the @videos variable for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video1 = Fabricate(:video, title: "Game of Thrones")
      video2 = Fabricate(:video, title: "Game of Zones")
      get :search, search_term: "Game"
      expect(assigns(:videos)).to eq([video2, video1])
    end

    it "renders the search template for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :search, search_term: ""
      expect(response).to render_template :search
    end

    it "redirects to root path for unauthenticated user" do
      get :search, search_term: ""
      expect(response).to redirect_to root_path
    end

  end

end
