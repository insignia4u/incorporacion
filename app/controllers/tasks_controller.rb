class TasksController < ApplicationController
  before_filter :authenticate_candidate!

  expose(:task)

  def complete
    task.candidates << current_candidate
    if current_candidate.complete_training_program?(task.training_program)
      ProgramTrainingMailer.completed_program(current_candidate,task.training_program).deliver
      flash[:success] = 'Training program completed successfully.'
    end
    flash[:success] = 'Task completed successfully.'
    render :js => "window.location = '#{training_program_path(task.training_program)}'"
  end

end
