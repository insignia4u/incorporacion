class ProgramTrainingMailer < ActionMailer::Base
  default from: "from@example.com"

  def completed_program(candidate, training_program)
    @candidate = candidate
    @training_program = training_program
    mail(to:candidate.email,
         subject:"#{candidate.first_name} has completed the training program #{training_program.name}" )
  end
end
