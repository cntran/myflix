require 'spec_helper'

describe UsersController do

  describe "GET new" do

    it "redirects to home path for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end

    it "sets the @user variable for unauthenticated user" do
      get :new
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end

  end


  describe "POST create" do

    it "creates a user with valid input" do
      user = Fabricate.attributes_for(:user, full_name: "Craig")
      post :create, user: user
      expect(User.count).to eq(1)
    end

    context "with invalid input" do

      let(:user) { Fabricate.attributes_for(:user, email: "") }

      before do
        post :create, user: user
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end

      it "does not create the user with invalid input" do
        expect(User.count).to eq(0)
      end

      it "sets the @user variable with invalid input" do
        expect(assigns(:user)).to be_instance_of(User)      
      end

    end

  end

end
