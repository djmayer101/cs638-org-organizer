class UsersController < ApplicationController
  before_filter :authenticate_user!
 before_filter do 
  redirect_to events_path unless current_user && current_user.admin?
  end
 # GET /users
  # GET /users.json
  def index
    @users = User.order("last_name").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end



  # PUT /users/1
  # PUT /users/1.json
respond_to :html, :json
def update
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  respond_with @user
end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end
