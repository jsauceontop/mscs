namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(firstname: "Example User",
                 lastname: "Example Last Name",
                 username: "exampleUserName",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 relatedMentor: nil,
                 isMentor: false)
    10.times do |n|
      firstname  = Faker::Name.first_name
      lastname = Faker::Name.last_name
      username = Faker::Internet.user_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      relatedMentor = nil
      isMentor = false
      User.create!(firstname: firstname,
                   lastname: lastname,
                   username: username,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   relatedMentor: nil, 
                   isMentor: false)
    end
  end
end