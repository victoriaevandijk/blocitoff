require 'faker'

10.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
        )
end
users = User.all

100.times do
    Item.create!(
       user: users.sample,
       name: Faker::Lorem.sentence
    )
end
items = Item.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"