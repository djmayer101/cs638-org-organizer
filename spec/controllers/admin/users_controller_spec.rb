require 'spec_helper'

describe Admin::UsersController do
  include Devise::TestHelpers

  #Uses spec/support/controller_macros
  login_user

  describe "Login /admin" do
    it "Logs in an admin to system" do
      user = FactoryGirl.create(:user)
      visit admin_home_index_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      page.should have_content("Admin Tools")
    end

  #   it "displays users in database" do
  #    get :index, {}
  #  page.should have_content("Bob")

  #   end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user)
      get :show, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user)
      get :edit, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        user = FactoryGirl.create(:user)
        expect {
          post :create, {:user => FactoryGirl.attributes_for(:user)}
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, {:user => FactoryGirl.attributes_for(:user)
          }
        response.should redirect_to("/admin/users/" + User.last.id.to_s())
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
      # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => {}}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
      # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = FactoryGirl.create(:user)
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => user.to_param, :user => {'these' => 'params'}}
      end

      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:user)
        put :update, {:id => user.to_param, :user => FactoryGirl.attributes_for(:user)}
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        user = FactoryGirl.create(:user)
        put :update, {:id => user.to_param, :user => FactoryGirl.attributes_for(:user)}
        response.should redirect_to(admin_user_url)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = FactoryGirl.create(:user)
    describe "with invalid param"
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {}}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = FactoryGirl.create(:user)
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = FactoryGirl.create(:user)
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = FactoryGirl.create(:user)
      delete :destroy, {:id => user.to_param}
      response.should redirect_to(admin_users_url)
    end
  end

end