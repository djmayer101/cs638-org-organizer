class User < ActiveRecord::Base
  has_many  :positions, :through => :position_assignments
  has_many  :duties,    :through => :duty_assignments
  has_many  :events
  validates :first_name,:presence=> true
  validates :last_name, :presence=> true

end