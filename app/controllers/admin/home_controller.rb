class Admin::HomeController < ApplicationController
 
   # GET /admin.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: :admin }
    end
  end
end