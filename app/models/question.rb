
class Question < ActiveRecord::Base
  attr_accessible :question_text, :title
  attr_accessor :tags
  belongs_to :user
  has_many   :answers
  has_many   :comments, as: :commentable
  has_many   :votes,    as: :votable

  validates_presence_of :question_text
  validates_presence_of :title


  def tags=(tag_list)
    array_of_tags = tags.split(', ').uniq
    array_of_tags.each do |tag|
      newtag = Tag.find_or_create_by_title(tag)
      self.tag << newtag unless existing_post_tags.include?(newtag.id)
    end
  end

  def tags
    @tags = self.tags
    string = ''
    @tags.each {|tag| string << tag.title + ","}
    string = string.chop 
  end
end
