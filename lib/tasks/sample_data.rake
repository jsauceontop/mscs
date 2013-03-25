namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      firstname  = Faker::Name.first_name
      lastname = Faker::Name.last_name
      username = Faker::Internet.user_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      relatedMentor = nil
      isMentor = false
      admin = User.create!(firstname: firstname,
                   lastname: lastname,
                   username: username,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   relatedMentor: nil, 
                   isMentor: false)
      admin.toggle!(:admin)
    end
  end
end