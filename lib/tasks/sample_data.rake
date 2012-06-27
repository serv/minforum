namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "ExampleAdminUser",
                         email: "exampleAdmin@test.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    User.create!(name: "ExampleUser",
                 email: "example@test.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = "namer#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 5)
    2.times do
      name = "Random #{rand(1000)}"
      description = Faker::Lorem.sentence(5)
      users.each { |user| user.forums.create!(name: name, description: description) }
    end
  end
end