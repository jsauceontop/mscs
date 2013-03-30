namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    20.times do |n|
      firstname  = Faker::Name.first_name
      lastname = Faker::Name.last_name
      username = Faker::Internet.user_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      relatedMentor = nil
      location = Faker::Address.state
      admin = User.create!(firstname: firstname,
                   lastname: lastname,
                   username: username,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   relatedMentor: nil,
                   location: location)
      admin.toggle!(:admin)
      admin.toggle!(:isMentor)
    end
    users = User.all(limit: 6)
    10.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.blogs.create!(content: content)}
    end
  end
end