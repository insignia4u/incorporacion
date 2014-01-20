class TasksController < ApplicationController
  before_filter :authenticate_candidate!

  expose(:task)
  expose(:training_program) { task.training_program }
  expose(:task_candidate)

  def complete
    task_candidate.candidate = current_candidate
    task_candidate.task = task
    if task_candidate.save
      flash[:success] = 'Task completed successfully.'
      if current_candidate.complete_training_program?(training_program)
        ProgramTrainingMailer.completed_program(current_candidate,task.training_program).deliver
        flash[:success] = 'Training program completed successfully.'
      end
    end
    render :js => "window.location = '#{training_program_path(task.training_program)}'"
  end

end
