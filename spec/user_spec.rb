require 'spec_helper'

describe User do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of (:email)}
  it { should have_many(:answers) }
  it { should have_many(:questions)
  it { should have_many(:commentables) }.through(:comments) }
  it { should have_many(:voteables).through(:votes) }

end

