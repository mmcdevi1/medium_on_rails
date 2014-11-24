namespace :db do 
  desc "Fill database with sample date" 
  task populate: :environment do 
    User.create!(first_name: "Michael", 
                 last_name: "McDevitt",
                 email: "mmcdevi1@gmail.com",
                 password: "koplop",
                 password_confirmation: "koplop",
                 admin: true)
    99.times do |n|
      name = Faker::Name.first_name
      lname = Faker::Name.last_name
      email = "example-#{n+1}@example.com"
      password = "koplop"
      User.create!(first_name: name, last_name: lname, email: email, password: password, password_confirmation: password)
    end

    users = User.all.limit(6)
    50.times do 
      title = Faker::Lorem.sentence(5)
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.posts.create!(title: title, content: content) }
    end
  end
end