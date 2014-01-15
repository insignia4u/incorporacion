FactoryGirl.define do
  factory :training_program do
    sequence(:name) {|n| "Language #{n}"}

    factory :training_program_with_tasks do
      tasks { build_list :task, 5 }
    end

    factory :training_program_with_tasks_saved do
      tasks { create_list :task, 5 }
    end
  end
end
