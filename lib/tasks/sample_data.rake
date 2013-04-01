namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #create fake users
    10.times do |n|
      firstname  = Faker::Name.first_name
      lastname = Faker::Name.last_name
      username = Faker::Internet.user_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      relatedMentor = nil
      location = Faker::Address.state
      user = User.create!(firstname: firstname,
                   lastname: lastname,
                   username: username,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   relatedMentor: nil,
                   location: location)
      user.toggle!(:admin)
      user.toggle!(:isMentor)
    end

    #create fake blogs
    users = User.all(limit: 5)
    10.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.blogs.create!(content: content)}
    end

    #create fake topics
    10.times do 
      title = Faker::Lorem.words(1)
      description = Faker::Lorem.sentence(1)
      topic = Topic.create!(
        title: title,
        description: description)
    end

  end
end