FactoryGirl.define do
  factory :candidate_action do
    description "I phoned the dude and he didn't answer"

    factory :candidate_action_with_action_category do
      action_category
    end
  end
end
