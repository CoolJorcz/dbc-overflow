
class Question < ActiveRecord::Base
  attr_accessible :question_text, :title, :tag_namez
  attr_accessor :tag_namez

  belongs_to :user
  has_many   :answers
  has_many   :comments, as: :commentable
  has_many   :votes,    as: :votable
  has_many :taggings, dependent: :destroy
  has_many   :tags, through: :taggings


  validates_presence_of :question_text
  validates_presence_of :title

  after_save :assign_tags

  def tag_name
    @tags = self.tag_namez.split(', ')
    string = ''
    @tags.each {|tag| string << tag.tagname + ","}
    string.chop 
  end

  private

  def assign_tags
    array_of_tags = tag_namez.split(', ').uniq
    array_of_tags.each do |tag|
      newtag = Tag.find_or_create_by_tagname(tag)
      self.tags << newtag unless taggings.include?(newtag.id)
    end
  end
end
