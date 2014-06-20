require 'spec_helper'

describe QueueItemsController do

  context "with authenticated user" do
  
    let(:user) { Fabricate(:user) }

    before do
      session[:user_id] = user.id
    end

    describe "GET index" do

      it "renders the index template" do
        get :index
        expect(response).to render_template :index
      end
      
      it "sets the @queue_items variable of the logged in user" do
        get :index
        expect(assigns(:queue_items)).to eq(user.queue_items)
      end

    end


    describe "POST create" do
    
      it "creates a queue item" do
        video = Fabricate(:video)
        post :create, video_id: video.id 
        expect(QueueItem.count).to eq(1)
      end

      it "creates a queue item associated with current user" do
        video = Fabricate(:video)
        post :create, video_id: video.id 
        expect(QueueItem.first.user).to eq(user)
      end

      it "redirects to my queue path" do
        video = Fabricate(:video)
        post :create, video_id: video.id 
        expect(response).to redirect_to my_queue_path
      end

      it "creates a queue item with position set to last in the queue" do
      
        video1 = Fabricate(:video)
        queue_item = Fabricate(:queue_item, video: video1, user: user, position: 1)
        
        video2 = Fabricate(:video)
        post :create, video_id: video2.id

        queue_item_posted = QueueItem.where(video_id: video2.id, user_id: user.id).first
        expect(queue_item_posted.position).to eq(2)

      end

    end

    describe "DELETE destroy" do

      it "removes queue item from the queue" do
        queue_item = Fabricate(:queue_item)
        delete :destroy, id: queue_item.id

        expect(QueueItem.count).to eq(0)
      end

      it "redirects to my queue path" do
        queue_item = Fabricate(:queue_item)
        delete :destroy, id: queue_item.id

        expect(response).to redirect_to my_queue_path
      end

    end

  end

  context "with unauthenticated user" do
    
    describe "GET index" do
    
      it "redirects to root path" do
        get :index
        expect(response).to redirect_to root_path 
      end
    
    end

  end

end
