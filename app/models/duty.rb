class Duty < ActiveRecord::Base
  belongs_to :user 
  belongs_to :assigned_user, :class_name => "User", :foreign_key => 'assigner_id' # user who created the duty
  has_and_belongs_to_many :users
  validates :title, :penalty, :presence=> true;

	validates :deadline,
  	:date => { :after => DateTime.now - 1.day }
  attr_accessible :title, :description, :deadline, :penalty, :confirmation, :user_ids, :assigned_user_id
end
