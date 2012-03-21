class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  has_many  :positions, :through => :position_assignments
  has_many  :duties,    :through => :duty_assignments
  has_many  :events
  validates :first_name,:presence=> true
  validates :last_name, :presence=> true
end


def new_random_password
  self.password= Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")[0,6]
  self.password_confirmation = self.password
end
