class EventsController < ApplicationController
  # GET /events
  # GET /events.json
#  if current_user.try(:admin?)
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        
        # add event to google cal        
        service = GCal4Ruby::Service.new
        service.authenticate("cs638khk", "KHKorgFTW")
        #cal_id = "cs638khk@gmail.com"
        cal_id = "tc3e71d7t5jm9a2q52j9tqepqo@group.calendar.google.com"
        
        cal = GCal4Ruby::Calendar.find(service, {:id => cal_id})
        events = cal1.events

          
        #event_g = GCal4Ruby::Event.new(service, {:calendar => cal, :title => "Meeting", :start => Time.parse("4-16-2012 at 12:30 PM"), :end => Time.parse("4-16-2012 at 1:30 PM"), :where => "The House"})
        event_g = GCal4Ruby::Event.new(service)
        event_g.title = "test title"
        event_g.content = "test content"
        event_g.where = "my house"
        event_g.start_time = Time.now
        event_g.end_time = 2.hours.from_now
       # event_g.all_day = false
        event_g.calendar = cal 
        
        event_g.save

        cal1.save

        
        
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  #end
end
