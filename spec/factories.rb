FactoryGirl.define do
  factory :user, class: User do 
   sequence(:email) { |n| "foo#{n}@foobar.com" }
   password  "foobar"
   first_name  "Bob"
   last_name   "Dabolina"
   admin    true
  end

  factory :user_with_duty, :parent => :user do
    after_create do |u|
	FactoryGirl.create(:duty, :user => u)
    end
  end

  factory :duty, class: Duty do 
   title	"my Duty"
   description	"clean"
   deadline	Date.today
   user_id	0 #user_id_parm
   penalty	"pay $5"
   confirmation	false
  end
end
