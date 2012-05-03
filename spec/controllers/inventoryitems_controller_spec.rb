require 'spec_helper'

describe InventoryitemsController do
  def valid_attributes
    {
      :name => "mykey",
      :cost => 1.5,
      :count => 5
    }
  end

  def invalid_name
    {
      :name => "",
      :cost => 1,
      :count =>1
    }
  end

  def invalid_cost
    {
      :name => "name",
      :cost => -1,
      :count => 1
    }
  end

  def invalid_count_neg
    {
      :name => "name",
      :cost => 1,
      :count => -1
    }
  end

  def invalid_count_decimal
    {
      :name => "name",
      :cost => 1,
      :count =>1.5
    }
  end

  login_user

  describe "GET show" do
    it "assigns the requested inventoryitem as @inventoryitem" do
      inventoryitem = FactoryGirl.create(:inventoryitem)
      get :show, {:id => inventoryitem.to_param}
      assigns(:inventoryitem).should eq(inventoryitem)
    end
  end

  describe "GET new" do
    it "assigns a new inventoryitem as @inventoryitem" do
      get :new, {}
      assigns(:inventoryitem).should be_a_new(Inventoryitem)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventoryitem as @inventoryitem" do
      inventoryitem = FactoryGirl.create(:inventoryitem)
      get :edit, {:id => inventoryitem.to_param}
      assigns(:inventoryitem).should eq(inventoryitem)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Inventoryitem" do
        expect {
          post :create, {:inventoryitem => valid_attributes}
        }.to change(Inventoryitem, :count).by(1)
      end

      it "assigns a newly created inventoryitem as @inventoryitem" do
        post :create, {:inventoryitem => FactoryGirl.attributes_for(:inventoryitem)}
        assigns(:inventoryitem).should be_a(Inventoryitem)
        assigns(:inventoryitem).should be_persisted
      end

      it "redirects to the created inventoryitem" do
        post :create, {:inventoryitem => FactoryGirl.attributes_for(:inventoryitem)}
        response.should redirect_to(Inventoryitem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inventoryitem as @inventoryitem" do
      # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        post :create, {:inventoryitem => {}}
        assigns(:inventoryitem).should be_a_new(Inventoryitem)
      end

      it "re-renders the 'new' template" do
      # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        post :create, {:inventoryitem => {}}
        response.should render_template("new")
      end

      it "assigns an inventory item an empty string" do
        expect {
          post :create, {:inventoryitem => invalid_name}
        }.to change(Inventoryitem, :count).by(0)
      end

      it "assigns an inventory item a negative cost" do
        expect {
          post :create, {:inventoryitem => invalid_cost}
        }.to change(Inventoryitem, :count).by(0)
      end

      it "assigns an inventory item a negative count" do
        expect {
          post :create, {:inventoryitem => invalid_count_neg}
        }.to change(Inventoryitem, :count).by(0)
      end

      it "assigns an inventory item a fractional count" do
        expect {
          post :create, {:inventoryitem => invalid_count_decimal}
        }.to change(Inventoryitem, :count).by(0)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inventoryitem" do
        inventoryitem = FactoryGirl.create(:inventoryitem)
        # Assuming there are no other inventoryitems in the database, this
        # specifies that the Inventoryitem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Inventoryitem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => inventoryitem.to_param, :inventoryitem => {'these' => 'params'}}
      end

      it "assigns the requested inventoryitem as @inventoryitem" do
        inventoryitem = FactoryGirl.create(:inventoryitem)
        put :update, {:id => inventoryitem.to_param, :inventoryitem => FactoryGirl.attributes_for(:inventoryitem)}
        assigns(:inventoryitem).should eq(inventoryitem)
      end

      it "redirects to the inventoryitem" do
        inventoryitem = FactoryGirl.create(:inventoryitem)
        put :update, {:id => inventoryitem.to_param, :inventoryitem => FactoryGirl.attributes_for(:inventoryitem)}
        response.should redirect_to(inventoryitem)
      end
    end

    describe "with invalid params" do
      it "assigns the inventoryitem as @inventoryitem" do
        inventoryitem = FactoryGirl.create(:inventoryitem)
        # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventoryitem.to_param, :inventoryitem => {}}
        assigns(:inventoryitem).should eq(inventoryitem)
      end

      it "re-renders the 'edit' template" do
        inventoryitem = FactoryGirl.create(:inventoryitem)
        # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventoryitem.to_param, :inventoryitem => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inventoryitem" do
      inventoryitem = Inventoryitem.create! valid_attributes
      expect {
        delete :destroy, {:id => inventoryitem.to_param}
      }.to change(Inventoryitem, :count).by(-1)
    end

    it "redirects to the inventoryitems list" do
      inventoryitem = Inventoryitem.create! valid_attributes
      delete :destroy, {:id => inventoryitem.to_param}
      response.should redirect_to(inventoryitems_url)
    end
  end

end
