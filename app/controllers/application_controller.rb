class ApplicationController < ActionController::Base
  protect_from_forgery
# require authentication before accessing any page comment the
# following line if you don't have a user in your database!
  before_filter :authenticate_user!
end
