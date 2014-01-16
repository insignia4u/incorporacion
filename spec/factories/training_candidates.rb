FactoryGirl.define do
  factory :training_candidate do
    candidate
    training_program
    started_on  DateTime.now
    ended_on    DateTime.now
  end
end
