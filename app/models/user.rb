class User < ActiveRecord::Base
	has_many :answers
	has_many :questions
	has_many :commentables, :through => :comments
	has_many :voteables, :through => :votes

	attr_accessible :username, :email, :password, :password_confirmation
	has_secure_password

end