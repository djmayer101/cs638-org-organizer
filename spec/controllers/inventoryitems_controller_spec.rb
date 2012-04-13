require 'spec_helper'

describe InventoryitemsController do

  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end



  describe "GET show" do
    it "assigns the requested inventoryitem as @inventoryitem" do
      inventoryitem = Inventoryitem.create! valid_attributes
      get :show, {:id => inventoryitem.to_param}, valid_session
      assigns(:inventoryitem).should eq(inventoryitem)
    end
  end

  describe "GET new" do
    it "assigns a new inventoryitem as @inventoryitem" do
      get :new, {}, valid_session
      assigns(:inventoryitem).should be_a_new(Inventoryitem)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventoryitem as @inventoryitem" do
      inventoryitem = Inventoryitem.create! valid_attributes
      get :edit, {:id => inventoryitem.to_param}, valid_session
      assigns(:inventoryitem).should eq(inventoryitem)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Inventoryitem" do
        expect {
          post :create, {:inventoryitem => valid_attributes}, valid_session
        }.to change(Inventoryitem, :count).by(1)
      end

      it "assigns a newly created inventoryitem as @inventoryitem" do
        post :create, {:inventoryitem => valid_attributes}, valid_session
        assigns(:inventoryitem).should be_a(Inventoryitem)
        assigns(:inventoryitem).should be_persisted
      end

      it "redirects to the created inventoryitem" do
        post :create, {:inventoryitem => valid_attributes}, valid_session
        response.should redirect_to(Inventoryitem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inventoryitem as @inventoryitem" do
        # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        post :create, {:inventoryitem => {}}, valid_session
        assigns(:inventoryitem).should be_a_new(Inventoryitem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        post :create, {:inventoryitem => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inventoryitem" do
        inventoryitem = Inventoryitem.create! valid_attributes
        # Assuming there are no other inventoryitems in the database, this
        # specifies that the Inventoryitem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Inventoryitem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => inventoryitem.to_param, :inventoryitem => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested inventoryitem as @inventoryitem" do
        inventoryitem = Inventoryitem.create! valid_attributes
        put :update, {:id => inventoryitem.to_param, :inventoryitem => valid_attributes}, valid_session
        assigns(:inventoryitem).should eq(inventoryitem)
      end

      it "redirects to the inventoryitem" do
        inventoryitem = Inventoryitem.create! valid_attributes
        put :update, {:id => inventoryitem.to_param, :inventoryitem => valid_attributes}, valid_session
        response.should redirect_to(inventoryitem)
      end
    end

    describe "with invalid params" do
      it "assigns the inventoryitem as @inventoryitem" do
        inventoryitem = Inventoryitem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventoryitem.to_param, :inventoryitem => {}}, valid_session
        assigns(:inventoryitem).should eq(inventoryitem)
      end

      it "re-renders the 'edit' template" do
        inventoryitem = Inventoryitem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Inventoryitem.any_instance.stub(:save).and_return(false)
        put :update, {:id => inventoryitem.to_param, :inventoryitem => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inventoryitem" do
      inventoryitem = Inventoryitem.create! valid_attributes
      expect {
        delete :destroy, {:id => inventoryitem.to_param}, valid_session
      }.to change(Inventoryitem, :count).by(-1)
    end

    it "redirects to the inventoryitems list" do
      inventoryitem = Inventoryitem.create! valid_attributes
      delete :destroy, {:id => inventoryitem.to_param}, valid_session
      response.should redirect_to(inventoryitems_url)
    end
  end

end
