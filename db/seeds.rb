# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def make_user
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  User.create(username: first + " " + last,
           email: first + "." + last + "@example.com",
           password: "password",
           password_confirmation: "password")
end



25.times do
	make_user
end

def make_question
	Question.create(title: Faker::Company.bs,
									question_text: Faker::Lorem.sentence)
end

User.all.each do |user|
  user.questions <<	make_question
end


Question.all.each do |question|
  question.answers.create(answer_text: "This is my answer text")
end
