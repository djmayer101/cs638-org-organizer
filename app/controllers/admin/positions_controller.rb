class Admin::PositionsController < ApplicationController
  
  # GET /positions
  # GET /positions.json
  def index
    @positions = Postion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions }
    end
  end
end
