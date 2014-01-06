FactoryGirl.define do
  factory :candidate_action do
    sequence(:description) {|n| "I phoned the dude and he didn't answer #{n}" }
    user

    factory :candidate_action_with_action_category do
      action_category
    end
  end
end
