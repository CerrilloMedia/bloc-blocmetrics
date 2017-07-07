require 'faker'

9.times do
    email = Faker::Internet.email
    password = email+"1"
    User.create!( email: email, password: password )
end

users = User.all

15.times do 
    user = users.sample
    title = Faker::Lorem.sentence(4)[0...15]
    url = Faker::Internet.url
    
    RegisteredApplication.create!(
        title: title,
        url: url,
        user_id: user.id
        )
end

apps = RegisteredApplication.all

45.times do
    app = apps.sample
    name = Faker::Job.field
    
    Event.create!(
        name: name,
        registered_application_id: app.id
        )
end

puts "generated #{User.all.count} users"
puts "generated #{RegisteredApplication.all.count} registered applications"
puts "generated #{Event.all.count} events"

