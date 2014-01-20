class Candidates::TrainingProgramsController < ApplicationController
  before_filter :authenticate_candidate!

  expose(:training_programs) { current_candidate.training_programs }
  expose(:training_program)

  def index; end

  def show; end

end
