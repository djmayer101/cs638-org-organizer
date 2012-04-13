require 'spec_helper'


describe DutiesController do
  include Devise::TestHelpers

  def valid_attributes
    {
  	:title	=> 	"my Duty",
   	:description => "clean",
  	:deadline => 	Date.today,
   	:user_id => 	0,
   	:penalty => 	"pay $5",
   	:confirmation => false
    }
  end
  
  #Uses spec/support/controller_macros
  login_user

  describe "GET show" do
    it "assigns the requested duty as @duty" do
      user = FactoryGirl.create(:user)
      duty = FactoryGirl.create(:duty)
      get :show, {:id => duty.to_param}
      assigns(:duty).should eq(duty)
    end
  end

  describe "GET new" do
    it "assigns a new duty as @duty" do
      get :new, {}
      assigns(:duty).should be_a_new(Duty)
    end
  end

  describe "GET edit" do
    it "assigns the requested duty as @duty" do
      user = FactoryGirl.create(:user)
      duty = FactoryGirl.create(:duty)
      get :edit, {:id => duty.to_param} 
      assigns(:duty).should eq(duty)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new duty" do
        expect {
          post :create, {:duty => FactoryGirl.attributes_for(:duty)}
        }.to change(Duty, :count).by(1)
      end

      it "assigns a newly created duty as @duty" do
        post :create, {:duty => FactoryGirl.attributes_for(:duty)}
        assigns(:duty).should be_a(Duty)
        assigns(:duty).should be_persisted
      end

      it "redirects to the created duty" do
        post :create, {:duty => FactoryGirl.attributes_for(:duty)}
        response.should redirect_to(Duty.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved duty as @duty" do
        # Trigger the behavior that occurs when invalid params are submitted
        Duty.any_instance.stub(:save).and_return(false)
        post :create, {:duty => {}}
        assigns(:duty).should be_a_new(Duty)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Duty.any_instance.stub(:save).and_return(false)
        post :create, {:duty => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested duty" do
	user = FactoryGirl.create(:user)
        duty = FactoryGirl.create(:duty)
	Duty.any_instance.should_receive(:update_attributes).with({'these' => 'params'})      
        put :update, {:id => duty.to_param, :duty => {'these' => 'params'}}
      end
    end

    describe "with invalid params" do
      it "updates the requested duty" do
	user = FactoryGirl.create(:user)
        duty = FactoryGirl.create(:duty)
	Duty.any_instance.should_receive(:update_attributes).with({'these' => 'params'})       
        put :update, {:id => duty.to_param, :duty => {'these' => 'params'}} 
      end
    end

    it "assigns the requested duty as @duty" do
	user = FactoryGirl.create(:user)
	post :create, {:duty => FactoryGirl.attributes_for(:duty)}
        duty = Duty.last
        put :update, {:id => duty.to_param, :duty => FactoryGirl.attributes_for(:duty)}
        assigns(:duty).should eq(duty)
      end
  end


  describe "DELETE destroy" do
    it "destroys the requested duty" do
      user = FactoryGirl.create(:user)
      duty = FactoryGirl.create(:duty)
      expect {
        delete :destroy, {:id => duty.to_param}
      }.to change(Duty, :count).by(-1)
    end

    it "redirects to the duties list" do
      user = FactoryGirl.create(:user)
      duty = FactoryGirl.create(:duty)
      delete :destroy, {:id => duty.to_param}
      response.should redirect_to(duties_url)
    end
  end

end
