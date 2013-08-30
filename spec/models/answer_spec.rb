require 'spec_helper'

describe Answer do
  it { should validate_presence_of(:answer_text) }
  it { should belong_to (:question) }
  it { should belong_to (:user) }
  it { should have_many(:commentables).through(:comments) }
  it { should have_many(:voteables).through(:votes) }

end
