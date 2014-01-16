class CandidateActionsController < ApplicationController
  before_filter :authenticate_user!

  # expose(:actions) { current_company.action_categories.actions }
  expose(:candidate)
  expose(:candidate_action) {
    CandidateActionService.build_with(candidate_action_params,
                                      current_user,
                                      candidate)
  }

  def index; end

  def new; end

  def create
    if candidate_action.save
      redirect_to candidate_path(candidate), success: 'candidate_action was successfully created.'
    else
      render :new
    end
  end

  private
    def candidate_action_params
      return {} unless params[:candidate_action_service]

      params.require(:candidate_action_service).permit(:description, :category_name, :candidate_id)
    end
end
