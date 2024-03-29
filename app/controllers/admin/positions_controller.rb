class Admin::PositionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to events_path unless current_user && current_user.admin?
  end

  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions }
    end
  end

  def assigned
  
    @position = Position.find(params[:id])
    
    if params[:position].blank?
      @position.user_ids = []
      redirect_to admin_positions_path, notice: 'Position was successfully assigned!'
      return
    end
    
    #This line was changed.    
    @position.user_ids = params[:position][:user_ids]

    respond_to do |format|
      if @position.save
        format.html { redirect_to admin_positions_path, notice: 'Position was successfully assigned!'}
        format.json { render json: @position}
      else
        format.html { render action: "assign" }
        format.json { render json: @position.errors, status: :unprocessable_entity}
      end
    end
  end

  # GET admin/positions/1/assign
  # GET admin/positions/1.json
  def assign
    @position = Position.find(params[:id])
    @users = User.order("last_name").all

    respond_to do |format|
      format.html # assign.html.erb
      format.json {render json: @position}
    end

  end

  # GET /positions/1
  # GET /positions/1.json
  def show
    @position = Position.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @position = Position.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to ([:admin ,@position]), notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.json
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])

        format.html { redirect_to ([:admin ,@position]), notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    #@position = Position.find(params[:id])
    #position.destroy
    Position.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to admin_positions_url }
      format.json { head :no_content }
    end
  end
end
