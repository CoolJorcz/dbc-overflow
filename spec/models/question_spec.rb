require 'spec_helper'

describe Question do
  it { should belong_to(:user)}
  it { should validate_presence_of(:question_text) }
  it { should validate_presence_of(:title)}
  it { should have_many(:answers)}
end
