FactoryGirl.define do
  factory :candidate do
    sequence(:first_name) {|n| "Jhon-#{n}"}
    last_name             'Doe'
    sequence(:email)      {|n| "candidate-#{n}@company.com"}

    cv_file_file_name     'test.pdf'
    cv_file_content_type  'application/pdf'
    cv_file_file_size     1024

    password                "123123123"
    password_confirmation   "123123123"

    confirmation_token      nil
    confirmed_at            DateTime.now

    invitation_accepted_at  DateTime.now

    factory :candidate_with_company do
      company
    end
  end
end
