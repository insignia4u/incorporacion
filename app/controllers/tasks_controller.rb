class TasksController < ApplicationController
  before_filter :authenticate_candidate!

  expose(:task)

  def complete
    task.candidates << current_candidate
    if task.save
      status = 200
    else
      status = 500
    end
    render json: status
  end

end
