class Event <ActiveRecord::Base
  #belongs_to  :user
 # has_and_belongs_to_many :users
  validates :title, :description, :location, :presence=> true
  validates :formality_lvl, :start_date, :end_date, :presence=> true

	validates :start_date,
  	:date => { :after => DateTime.now }

	validates :end_date,
  	:date => { :after => :start_date } 
  attr_accessible :title, :description, :location, :formality_lvl, :start_date, :end_date


end
