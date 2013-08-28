class Question < ActiveRecord::Base
  attr_accessible :question_text

  belongs_to :user
  has_many   :answers
  has_many   :comments, as: :commentable
  has_many   :votes,    as: :votable
end
