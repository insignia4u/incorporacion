class TrainingProgramStrategy < DecentExposure::Strategy
  delegate :current_user, to: :controller

  def resource
    current_company = current_user.company
    return current_company.training_programs unless params[:candidate_id]
    Candidate.find(params[:candidate_id]).training_programs
  end
end
