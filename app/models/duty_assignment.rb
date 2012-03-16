class Duty_Assignment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :duty
end