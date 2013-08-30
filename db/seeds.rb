# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# make 25 users
25.times do
	  first = Faker::Name.first_name
  last = Faker::Name.last_name
  User.create(username: first + " " + last,
           email: first + "." + last + "@example.com",
           password: "password",
           password_confirmation: "password")
end

# Give each user a question
User.all.each do |user|
  user.questions <<	Question.create(title: Faker::Company.bs, question_text: Faker::Lorem.sentence)
end

#
Question.all.each_with_index do |question, index|
  # adding an answer to a question
  question.answers.create(answer_text: "This is my answer text")


  # adding comment to question
  comment = Comment.create(body: "COMMENT ON QUESTION!")
  question.comments << comment

  # make association between User and their comment on question
  User.find(index + 1).comments << comment
end

# adding a comment to each answer
Answer.all.each_with_index do |answer, index|
  comment = Comment.create(body: "COMMENT ON ANSWER!" )
  answer.comments << comment

  # make association between User and their comment on answer
  User.find(index + 1).comments << comment
end

