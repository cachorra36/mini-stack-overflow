# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email:"example@example.com", password:"12345678")
User.create(email:"example2@example.com", password:"12345678")

number = 5
number.times do |user|
  add_password = Faker::Internet.password
  user = User.create(email: Faker::Internet.email, password: add_password)
  5.times do |question|
    question = Question.create(user: user, title: Faker::Name.title, description: Faker::Hacker.say_something_smart)
  end
end

Question.all.each do |question|
  2.times do |answer|
    answer = Answer.create(user_id: User.find(rand(1..number)).id, question: question, title: Faker::Name.title, description: Faker::Hacker.say_something_smart)
  end
end