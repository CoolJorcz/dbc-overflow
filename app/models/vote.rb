class Vote < ActiveRecord::Base
  attr_accessible :choice
  belongs_to :user
  belongs_to :votable, polymorphic: true
  # belongs_to :commentable
end
