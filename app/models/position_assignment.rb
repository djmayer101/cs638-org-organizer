class Position_Assignment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :position 
end