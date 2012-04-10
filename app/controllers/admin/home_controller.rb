class Admin::HomeController < ApplicationController
# before_filter :authenticate_user!
 # before_filter do 
  #  redirect_to :new_user_session_path unless current_user && current_user.admin?
  #end
   # GET /admin.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: :admin }
    end
  end
end