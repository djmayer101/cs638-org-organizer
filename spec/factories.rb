FactoryGirl.define do
  factory :user, class: User do 
   sequence(:email) { |n| "foo#{n}@foobar.com" }
   password  "foobar"
   first_name  "Bob"
   last_name   "Dabolina"
   admin    true
  end

  factory :duty, class: Duty do 
   title	"my Duty"
   description	"clean"
   deadline	Date.today
   user_id	0 #user_id_parm
   penalty	"pay $5"
   confirmation	false
  end
  
  factory :position, class: Position do
      title "St8 Boss"
      description "This is the boss"
  end
  
  factory :inventoryitem, class: Inventoryitem do 
   name  "key"
   cost  1.55
   count 4
  end
end
