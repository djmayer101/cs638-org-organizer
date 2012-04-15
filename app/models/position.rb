class Position < ActiveRecord::Base
  #has_many  :users, :through => :position_assignments
  has_and_belongs_to_many :users
  validates :title, :presence => true
end