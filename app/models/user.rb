class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :admin
  has_many  :positions, :through => :position_assignments
  has_many  :assigned_duties, :class_name => "Duty"
  has_and_belongs_to_many  :duties
  has_many  :events
  validates :first_name,:presence=> true
  validates :last_name, :presence=> true
end


def new_random_password
  self.password= Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")[0,6]
  self.password_confirmation = self.password
end
