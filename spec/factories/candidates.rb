FactoryGirl.define do
  factory :candidate do
    first_name            'Jhon'
    last_name             'Doe'
    sequence(:email)      {|n| "candidate-#{n}@company.com"}

    cv_file_file_name     'test.pdf'
    cv_file_content_type  'application/pdf'
    cv_file_file_size     1024

    factory :candidate_with_company do
      company
    end
  end
end
