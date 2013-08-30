require 'spec_helper'

describe Question do
  it { should belong_to(:user)}
  it { should validate_presence_of(:question_text) }
  it { should validate_presence_of(:title)}
  it { should have_many(:answers)}
  it { should have_many(:commentable).through(:comments)}
  it { should have_many(:votable).through(:votes)}

end
