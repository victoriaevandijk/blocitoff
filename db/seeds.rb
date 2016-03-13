require 'faker'

15.times do
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

24.times do
  List.create(title: Faker::Company.buzzword, user: users.sample)
end
lists = List.all

150.times do
    item = Item.create!(
       name: Faker::Lorem.sentence,
       list: lists.sample
    )
  item.update_attribute(:created_at, rand(10.minutes .. 8.days).ago)
end
items = Item.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"