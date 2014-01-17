class AssignTrainingProgramController < ApplicationController
  before_filter :authenticate_user!

  expose(:training_program)
  expose(:training_candidate, attributes: :training_candidate_params)
  expose(:candidates, strategy:UnassignedTrainingCandidateStrategy)

  def new; end

  def create
    if training_candidate.save
      redirect_to training_programs_url, success: 'Assignation was successfully created.'
    else
      render :new
    end
  end

  private

    def training_candidate_params
      params.require(:training_candidate).permit(:candidate_id).tap do |p|
        p[:training_program_id] = params[:training_program_id]
      end
    end
end
