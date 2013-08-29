class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
end
