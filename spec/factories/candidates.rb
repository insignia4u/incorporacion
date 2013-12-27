FactoryGirl.define do
  factory :candidate do
    first_name       'Jhon'
    last_name        'Doe'
    sequence(:email) {|n| "candidate-#{n}@company.com"}

    factory :candidate_with_company do
      company
    end
  end
end