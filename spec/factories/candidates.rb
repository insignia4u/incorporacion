FactoryGirl.define do
  factory :candidate do
    first_name       'Jhon'
    last_name        'Doe'
    sequence(:email) {|n| "candidate-#{n}@company.com"}

    password                "123123123"
    password_confirmation   "123123123"

    confirmation_token      nil
    confirmed_at            DateTime.now

    factory :candidate_with_company do
      company
    end
  end
end
