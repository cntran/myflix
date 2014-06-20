require 'spec_helper'

describe SessionsController do

  describe "GET new" do

    it "renders the new template for unauthenticated user" do
      get :new
      expect(response).to render_template :new
    end

    it "redirects to home path for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end

  end

  describe "POST create" do

    context "with valid credentials" do

      let(:user) { Fabricate(:user) } 

      before do
        post :create, email: user.email, password: user.password
      end

      it "sets the user id session variable" do
        expect(session[:user_id]).to eq(user.id)
      end

      it "sets the flash success variable" do
        expect(flash[:success]).to be
      end

      it "redirects user to root path" do
        expect(response).to redirect_to root_path
      end

    end

    context "with invalid credentials" do

      let(:user) { Fabricate(:user) }

      it "sets the flash danger variable" do
        post :create, email: user.email, password: "badpassword"
        expect(flash[:danger]).to be
      end

      it "redirects user to sign in path" do
        post :create, email: user.email, password: "badpassword"
        expect(response).to redirect_to sign_in_path
      end

    end

  end

  describe "GET destroy" do

    it "sets the user_id session to nil" do
      get :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirects to root path" do
      get :destroy
      expect(response).to redirect_to root_path
    end

  end

end
