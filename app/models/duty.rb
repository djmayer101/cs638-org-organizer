class Duty < ActiveRecord::Base
  belongs_to :user;
  validates :title, :penalty, :presence=> true;
  validates :assignee, :assigner, :numericality => true;
  
end
