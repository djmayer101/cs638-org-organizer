FactoryGirl.define do
  factory :user, class: User do 
   sequence(:email) { |n| "foo#{n}@foobar.com" }
   password  "foobar"
   first_name  "Bob"
   last_name   "Dabolina"
   admin    true
  end
end