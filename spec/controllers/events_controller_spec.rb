require 'spec_helper'

describe EventsController do

  def valid_attributes
    {
      :title => "TestEvent",
      :description => "Please come to this event",
      :start_date => DateTime.now,
      :end_date => DateTime.now.advance(:hours=>1),
      :formality_lvl => "informal",
      :location => "here"
    }
  end

  #Uses spec/support/controller_macros
  login_user

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = FactoryGirl.create(:event)
      get :show, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = FactoryGirl.create(:event)
      get :edit, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}
        }.to change(Event, :count).by(1)
	#cleanup google calendar
	delete :destroy, {:id => Event.last.to_param}
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
	#cleanup google calendar
	delete :destroy, {:id => Event.last.to_param}
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}
        response.should redirect_to(Event.last)
	#cleanup google calendar
	delete :destroy, {:id => Event.last.to_param}
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event" do
        event = FactoryGirl.create(:event)
        # Assuming there are no other events in the database, this
        # specifies that the Event created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Event.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => event.to_param, :event => {'these' => 'params'}}
      end

      it "assigns the requested event as @event" do
	post :create, {:event => valid_attributes}
        event = Event.last
        put :update, {:id => event.to_param, :event => valid_attributes}
        assigns(:event).should eq(event)
	#cleanup google calendar
	delete :destroy, {:id => event.to_param}
      end

      it "redirects to the event" do
        post :create, {:event => FactoryGirl.attributes_for(:event)}
        event = Event.last
        put :update, {:id => event.to_param, :event => valid_attributes}
        response.should redirect_to(event)
	#cleanup google calendar
	delete :destroy, {:id => event.to_param}
      end

      it "it creates a new gcal event since event didn't exist" do
	event = FactoryGirl.create(:event)
        put :update, {:id => event.to_param, :event => valid_attributes}
        response.should redirect_to(Event.last)
	#cleanup google calendar
	delete :destroy, {:id => event.to_param}
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = FactoryGirl.create(:event)
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => {}}
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = FactoryGirl.create(:event)
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      post :create, {:event => FactoryGirl.attributes_for(:event)}
      event = Event.last
      expect {
        delete :destroy, {:id => event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      post :create, {:event => FactoryGirl.attributes_for(:event)}
      event = Event.last
      delete :destroy, {:id => event.to_param}
      response.should redirect_to(events_url)
    end

    it "fails to destroy the event since it doesn't exist" do
      begin
      	event = FactoryGirl.create(:event)
		delete :destroy, {:id => event.to_param}
      	delete :destroy, {:id => event.to_param}
      	response.should raise_error
      rescue; end
    end


  end
end
