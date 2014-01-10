FactoryGirl.define do
  factory :training_program do
    sequence(:name) {|n| "Language #{n}"}

    factory :training_program_with_tasks do
      tasks { build_list :task, 5 }
    end
  end
end
