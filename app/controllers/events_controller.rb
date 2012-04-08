class EventsController < ApplicationController
  
  #specify which calendar to use
  @@cal_id = "cs638khk@gmail.com"    #actual
  #@@cal_id = "tc3e71d7t5jm9a2q52j9tqepqo@group.calendar.google.com"   #dev
        
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
        # create session with Google        
        service = GCal4Ruby::Service.new
        service.authenticate("cs638khk", "KHKorgFTW")

        #connect to calendar
        cal = GCal4Ruby::Calendar.find(service, {:id => @@cal_id})
        
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        
        #create and add event to calendar
        event_g = GCal4Ruby::Event.new(service)
        event_g.title = @event.title
        event_g.content = @event.description
        event_g.where = @event.location
        event_g.start_time = @event.start_date
        event_g.end_time = @event.end_date
        event_g.calendar = cal 
        
        #remember to save
        event_g.save
        cal.save
        
      #  puts "\n\n\n\n\n\n\n\nevent id" + event_g.id + "\n\n\n\n\n"
        
        #@event.update_attributes(params[:event])

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
        # create session with Google        
        service = GCal4Ruby::Service.new
        service.authenticate("cs638khk", "KHKorgFTW")
        
        #connect to calendar
        cal = GCal4Ruby::Calendar.find(service, {:id => @@cal_id})
        
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
        
        
        if false
        event_g = GCal4Ruby::Event.find(service, {:title => @event.title}).first
        #create and add event 
        #event_g = GCal4Ruby::Event.new(service)
        event_g.title = @event.title
        event_g.content = @event.description
        event_g.where = @event.location
        event_g.start_time = @event.start_date
        event_g.end_time = @event.end_date
        event_g.calendar = cal 
        
        #remember to save
        event_g.save
        cal.save
        end
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
    # create session with Google        
    service = GCal4Ruby::Service.new
    service.authenticate("cs638khk", "KHKorgFTW")
        
    #connect to calendar
    cal = GCal4Ruby::Calendar.find(service, {:id => @@cal_id})
    
    event_g = GCal4Ruby::Event.find(service, {:title => @event.title}).first
    
    if false
    if event_g.title.nil?
      puts "Couldn't find"
    else
      event_g.delete
      cal.save
      @event.destroy
    end  
    end
    
    @event.destroy
    

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  #end
end
