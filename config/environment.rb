# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Cs638OrgOrganizer::Application.initialize!
ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 25,
  :user_name  => "cs638khk",
  :password  => "KHKorgFTW",
  :authentication  => :login
}