class ProgramTrainingMailer < ActionMailer::Base
  include Sidekiq::Worker
  default from: "from@example.com"

  def completed_program(candidate, training_program)
    @candidate = candidate
    @training_program = training_program
    candidate.company_users.each do |user|
      mail( to:user.email ,
           subject:
            "#{candidate.full_name} has completed the #{training_program.name} training program" ).deliver
    end
  end
end
