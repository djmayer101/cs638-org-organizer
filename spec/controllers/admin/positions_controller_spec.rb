require 'spec_helper'

describe Admin::PositionsController do
  include Devise::TestHelpers

  login_user


  describe "GET assign" do
    it "assigns the requested position as @position" do
      position = FactoryGirl.create(:position)
      get :assign, {:id => position.to_param}
      assigns(:position).should eq(position)
    end
  end
  
  describe "PUT assigned" do
    it "assigns a position to a user" do
      user = FactoryGirl.create(:user)
      position = FactoryGirl.create(:position)
      put :assigned, {:id => position.to_param, :user_ids => user.id}
      response.should redirect_to(admin_positions_url)
    end
  end
  
  describe "GET show" do
    it "assign the requested position as @position" do
      position = FactoryGirl.create(:position)
      get :show, {:id => position.to_param}
      assigns(:position).should eq(position)
    end
  end

  describe "GET new" do
    it "assigns a new position as @position" do
      get :new, {}
      assigns(:position).should be_a_new(Position)
    end
  end

  describe "GET edit" do
    it "assigns the requested position as @postions" do
      position = FactoryGirl.create(:position)
      get :edit, {:id => position.to_param}
      assigns(:position).should eq(position)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Position" do
        position = FactoryGirl.create(:position)
        expect {
          post :create, {:position => FactoryGirl.attributes_for(:position)}
        }.to change(Position, :count).by(1)
      end

      it "redirects to the created position" do
        post :create, {:position => FactoryGirl.attributes_for(:position)}
        response.should redirect_to("/admin/positions/" + Position.last.id.to_s())
      end
    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved position as @position" do
      # Trigger the behavior that occurs when invalid params are submitted
        Position.any_instance.stub(:save).and_return(false)
        post :create, {:position => {}}
        assigns(:position).should be_a_new(Position)
      end

      it "re-renders the 'new' template" do
      # Trigger the behavior that occurs when invalid params are submitted
        Position.any_instance.stub(:save).and_return(false)
        post :create, {:position => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested position" do
        position = FactoryGirl.create(:position)
        # Assuming there are no other positions in the database, this
        # specifies that the Position created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Position.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => position.to_param, :position => {'these' => 'params'}}
      end

      it "assigns the requested position as @position" do
        position = FactoryGirl.create(:position)
        put :update, {:id => position.to_param, :position => FactoryGirl.attributes_for(:position)}
        assigns(:position).should eq(position)
      end

      it "redirects to the position" do
        position = FactoryGirl.create(:position)
        put :update, {:id => position.to_param, :position => FactoryGirl.attributes_for(:position)}
        response.should redirect_to(admin_position_url)
      end
    end

    describe "with invalid params" do
      it "assigns the position as @position" do
        position = FactoryGirl.create(:position)
        Position.any_instance.stub(:save).and_return(false)
        put :update, {:id => position.to_param, :position => {}}
        assigns(:position).should eq(position)
      end

      it "re-renders the 'edit" do
        position = FactoryGirl.create(:position)
        Position.any_instance.stub(:save).and_return(false)
        put :update, {:id => position.to_param, :position => {}}
        response.should render_template("edit")
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested position" do
        position = FactoryGirl.create(:position)
        expect{
          delete :destroy, {:id => position.to_param}
        }.to change(Position, :count).by(-1)
      end

      it "rediects to the positions list" do
        position = FactoryGirl.create(:position)
        delete :destroy, {:id => position.to_param}
        response.should redirect_to(admin_positions_url)
      end
    end
  end
end
