class Duty < ActiveRecord::Base
  belongs_to  :assigner , { :foreign_key => "assigner" }, :class_name => "User"
  has_and_belongs_to_many :assignees, :class_name => "User"
  validates :title, :penalty, :presence=> true;
  validates :assignee, :assigner, :numericality => true;
  
end
