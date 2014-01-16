FactoryGirl.define do
  factory :task do
    sequence(:title) {|n| "Title #{n}"}
    description      'Lorem impsum valor...'

    factory :task_with_training_program_saved do
      training_program { create :training_program }
    end
  end
end
