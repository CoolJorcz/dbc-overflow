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
User.all.each_with_index do |user, index|
  user.questions <<	Question.create(title: "Question Title #{index + 1}", question_text: "Question Text #{index + 1}")
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

# add an up vote to each question
Question.all.each do |q|
  v = Vote.create(choice: true)
  User.find(rand(1..User.all.size)).votes << v  # user who upvoted associated to vote
  q.votes << v                            # question voted on associated to vote
end

# add an down vote to each question
Answer.all.each do |a|
  v = Vote.create(choice: false)
  User.find(rand(1..User.all.size)).votes << v  # user who upvoted associated to vote
  a.votes << v                            # answer voted on associated to vote
end

