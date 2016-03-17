require 'faker'

50.times do
    User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
        )
end
users = User.all

User.create!(
  name: "Torie",
  email: 'victoriaevandijk@gmail.com',
  password: 'helloworld'
)

100.times do
  List.create(title: Faker::Company.buzzword, user: users.sample)
end
lists = List.all

500.times do
    item = Item.create!(
       name: Faker::Lorem.sentence,
       list: lists.sample
    )
  item.update_attribute(:created_at, rand(10.minutes .. 8.days).ago)
end
items = Item.all

users = User.all
user  = users.last
following = users[2..51]
followers = users[3..50]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"