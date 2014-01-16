class CandidatesController < ApplicationController
  before_filter :authenticate_user!

  expose(:candidates) { current_company.candidates }
  expose(:candidate, attributes: :candidate_params)
  expose(:feeds) { CandidateFeedService.build_with(candidate) }


  def index; end

  def new; end

  def create
    if candidate.save
      flash[:success] = 'Candidate was successfully created.'
      redirect_to candidates_url
    else
      render :new
    end
  end

  def invite
    if candidate.invite!
      flash[:success] = 'Invitation was successfully sent.'
    else
      flash[:error] = "Invitation wasn't sent."
    end
    redirect_to candidates_url
  end

  private

    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :cv_file)
    end
end
