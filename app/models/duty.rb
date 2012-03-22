class Duty < ActiveRecord::Base
  has_many :user, :through => :duty_assignments
  validates :title, :penalty, :presence=> true;
  validates :assignee, :assigner, :numericality => true;
  
end
