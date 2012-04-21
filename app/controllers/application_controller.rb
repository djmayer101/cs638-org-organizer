class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  Time.zone = "America/Chicago"

end
