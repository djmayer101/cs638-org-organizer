FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "foo#{n}@foobar.com" }
    password  "foobar"
    first_name  "Bob"
    last_name   "Dabolina"
    admin    true
  end

  factory :event, class: Event do
    title		"my Event"
    description	"fun things"
    start_date 	DateTime.now
    end_date 	DateTime.now.advance(:hours=>1)
    formality_lvl	"formal"
    location		"here"
  end

  factory :duty, class: Duty do
    title	"my Duty"
    description	"clean"
    deadline	Date.today
    user
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
