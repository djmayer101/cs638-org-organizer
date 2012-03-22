class ApplicationController < ActionController::Base
  protect_from_forgery
  # application_controller.rb

  before_filter :authenticate_user!
end
