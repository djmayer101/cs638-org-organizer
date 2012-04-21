class Event <ActiveRecord::Base
  #belongs_to  :user
 # has_and_belongs_to_many :users
  validates :title, :description, :location, :presence=> true
  validates :formality_lvl, :start_date, :end_date, :presence=> true
  
  validate :after_start_date
  
  def after_start_date
    errors.add :base, ("End Date must be after the Start Date") unless end_date.to_f > start_date.to_f
  end

end
