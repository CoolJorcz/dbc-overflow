class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
end
