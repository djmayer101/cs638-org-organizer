class DutyAssignmentsController < ApplicationController
  # GET /duty_assignments
  # GET /duty_assignments.json
  def index
    @duty_assignments = DutyAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @duty_assignments }
    end
  end

  # GET /duty_assignments/1
  # GET /duty_assignments/1.json
  def show
    @duty_assignment = DutyAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @duty_assignment }
    end
  end

  # GET /duty_assignments/new
  # GET /duty_assignments/new.json
  def new
    @duty_assignment = DutyAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @duty_assignment }
    end
  end

  # GET /duty_assignments/1/edit
  def edit
    @duty_assignment = DutyAssignment.find(params[:id])
  end

  # POST /duty_assignments
  # POST /duty_assignments.json
  def create
    @duty_assignment = DutyAssignment.new(params[:duty_assignment])

    respond_to do |format|
      if @duty_assignment.save
        format.html { redirect_to @duty_assignment, notice: 'Duty assignment was successfully created.' }
        format.json { render json: @duty_assignment, status: :created, location: @duty_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @duty_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /duty_assignments/1
  # PUT /duty_assignments/1.json
  def update
    @duty_assignment = DutyAssignment.find(params[:id])

    respond_to do |format|
      if @duty_assignment.update_attributes(params[:duty_assignment])
        format.html { redirect_to @duty_assignment, notice: 'Duty assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @duty_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duty_assignments/1
  # DELETE /duty_assignments/1.json
  def destroy
    @duty_assignment = DutyAssignment.find(params[:id])
    @duty_assignment.destroy

    respond_to do |format|
      format.html { redirect_to duty_assignments_url }
      format.json { head :no_content }
    end
  end
end
