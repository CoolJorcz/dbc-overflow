class User < ActiveRecord::Base
	has_many :answers
	has_many :questions
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
	validates_presence_of :username
	validates_presence_of :email
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

	attr_accessible :username, :email, :password, :password_confirmation
	has_secure_password

end
