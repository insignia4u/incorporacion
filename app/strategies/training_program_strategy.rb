class TrainingProgramStrategy < DecentExposure::Strategy
  delegate :current_user, to: :controller
  delegate :current_candidate, to: :controller

  def resource
    current_company = current_user.company
    return current_company.training_programs unless current_candidate
    current_candidate.training_programs
  end
end
