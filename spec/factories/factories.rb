FactoryGirl.define do
  factory :user do
    full_name        'Tony Stark'
    email            'tony@starkinc.com'
    password         '123123123'
    company
  end

  factory :company do
    name             'Stark Inc'
  end

  factory :candidate do
    first_name       'Steve'
    last_name        'Rogers'
    email            'info@captainamerica.com'

    factory :candidate_with_company do
      company
    end
  end
end