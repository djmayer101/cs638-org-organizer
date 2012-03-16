class Position < ActiveRecord::Base
  has_many  :users, :through => :position_assignments

end