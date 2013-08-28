class User < ActiveRecord::Base
	has_many :answers
	has_many :questions
	has_many :commentables, :through => :comments
	has_many :voteables, :through => :votes
	
	has_secure_password

end