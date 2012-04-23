class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name 

  has_and_belongs_to_many :positions
  
  has_many  :assigned_duties, :class_name => "Duty", :foreign_key => 'assigner_id'
  has_and_belongs_to_many  :duties
  has_many  :events
  validates :first_name,:presence=> true,
            :length => {:maximum => 254}
  validates :last_name, :presence=> true,
            :length => {:maximum => 254}
  

  def self.generate_password(length=6)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
    password = ''
    length.times { |i| password << chars[rand(chars.length)] }
    return password
  end
end
