class Duty < ActiveRecord::Base
  belongs_to :user
  #belongs_to  :assigner , :class_name => "User"
  has_and_belongs_to_many :users
  validates :title, :penalty, :presence=> true;
  #validates :assigner, :numericality => true;
  
end
