class Question < ActiveRecord::Base
  attr_accessible :question_text, :title

  belongs_to :user
  has_many   :answers
  has_many   :comments, as: :commentable
  has_many   :votes,    as: :votable

  validates :question_text, presence: true
end
