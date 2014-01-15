class UnassignedTrainingCandidateStrategy < DecentExposure::Strategy
  delegate :current_user, to: :controller
  delegate :training_program, to: :controller
  def resource
    current_company = current_user.company
    ids = TrainingCandidate.where(training_program_id: training_program.id)
                           .collect {|obj| obj.candidate_id }
    current_company.candidates.where.not(id:ids)
  end
end
