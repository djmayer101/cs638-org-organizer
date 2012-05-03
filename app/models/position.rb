class Position < ActiveRecord::Base
  #has_many  :users, :through => :position_assignments
  attr_accessible :title, :description, :addEvents, :addDuties, :addItems, :user_ids
  has_and_belongs_to_many :users
  validates :title, :presence => true
end