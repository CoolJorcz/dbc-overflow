FactoryGirl.define do

  factory :user do
    username "Joe12345"
    email
    password "12345"

    factory :admin do
      admin true
    end

  end

end