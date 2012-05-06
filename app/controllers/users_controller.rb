class UsersController < ApplicationController
  before_filter :authenticate_user!
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

  #
  # Change user passowrd
  def change_password
    @user = User.find(current_user.id)
  
  end

  #
  # Change user passowrd
  def change_password_update
      @user = User.find(current_user.id)
      sign_out @user
      @user.send_reset_password_instructions
      flash[:notice] = t('devise.passwords.send_instructions') 
      redirect_to "/profile"
    end

end
