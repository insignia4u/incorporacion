class AssignTrainingProgramController < ApplicationController
  before_filter :authenticate_user!

  expose(:training_programs) { current_company.training_programs }
  expose(:training_program, ancestor: :training_programs)
  expose(:training_candidate, attributes: :training_candidate_params)
  expose(:candidates) do
    ids = TrainingCandidate.where(training_program_id: training_program.id)
    current_company.candidates.where.not(id:ids)
  end

  def new; end

  def create
    training_candidate.training_program = training_program
    if training_candidate.save
      redirect_to training_programs_url, success: 'Assignation was successfully created.'
    else
      render :new
    end
  end

  private

    def training_candidate_params
      params.require(:training_candidate).permit(:candidate_id)
    end
end
