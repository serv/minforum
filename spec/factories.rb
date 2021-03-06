FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
  
  factory :forum do
    name 'Jason Forum1'
    description 'The factory_girl gem is used to create default model objects for tests. For example, if a controller action requires finding a User object before displaying...'
    user
  end
  
  factory :topic do
    name 'The application generator template will ask you for your preferences'
    views 10
    forum_id 1
    last_post_id 10
  end
end