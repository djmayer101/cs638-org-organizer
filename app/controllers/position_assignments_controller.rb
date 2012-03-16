class PositionAssignmentsController < ApplicationController
  # GET /position_assignments
  # GET /position_assignments.json
  def index
    @position_assignments = PositionAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @position_assignments }
    end
  end

  # GET /position_assignments/1
  # GET /position_assignments/1.json
  def show
    @position_assignment = PositionAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position_assignment }
    end
  end

  # GET /position_assignments/new
  # GET /position_assignments/new.json
  def new
    @position_assignment = PositionAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position_assignment }
    end
  end

  # GET /position_assignments/1/edit
  def edit
    @position_assignment = PositionAssignment.find(params[:id])
  end

  # POST /position_assignments
  # POST /position_assignments.json
  def create
    @position_assignment = PositionAssignment.new(params[:position_assignment])

    respond_to do |format|
      if @position_assignment.save
        format.html { redirect_to @position_assignment, notice: 'Position assignment was successfully created.' }
        format.json { render json: @position_assignment, status: :created, location: @position_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @position_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /position_assignments/1
  # PUT /position_assignments/1.json
  def update
    @position_assignment = PositionAssignment.find(params[:id])

    respond_to do |format|
      if @position_assignment.update_attributes(params[:position_assignment])
        format.html { redirect_to @position_assignment, notice: 'Position assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_assignments/1
  # DELETE /position_assignments/1.json
  def destroy
    @position_assignment = PositionAssignment.find(params[:id])
    @position_assignment.destroy

    respond_to do |format|
      format.html { redirect_to position_assignments_url }
      format.json { head :no_content }
    end
  end
end
