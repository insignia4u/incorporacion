class TrainingProgramsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :authorized_admin, only: [:new, :create]

  expose(:training_programs) { current_company.training_programs }
  expose(:training_program, attributes: :training_program_params)
  expose(:tasks) { training_program.tasks }
  expose(:candidate)

  def index; end

  def new
    3.times { tasks.build }
  end

  def create
    if training_program.save
      redirect_to training_programs_url, success: 'Training Program was successfully created.'
    else
      render :new
    end
  end

  private

    def training_program_params
      params.require(:training_program).permit(:name,
        tasks_attributes:[:title, :description, :_destroy])
    end
end
