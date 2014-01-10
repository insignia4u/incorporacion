FactoryGirl.define do
  factory :task do
    sequence(:title) {|n| "Title #{n}"}
    description      'Lorem impsum valor...'
  end
end
