FactoryGirl.define do
  factory :user do
    full_name             'Jhon Doe'
    sequence(:email)      {|n| "john-#{n}@doe.test"}

    password              '123123123'
    password_confirmation '123123123'

    confirmation_sent_at          DateTime.now
    confirmed_at                  DateTime.now
    sequence(:confirmation_token) {|n| "n"}
    company
  end
end
