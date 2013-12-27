class CandidatesController < ApplicationController
  before_filter :authenticate_user!

  expose(:candidates) { current_company.candidates }
  expose(:candidate, attributes: :candidate_params)


  def index; end
  
  def new; end

  def create
    if candidate.save
      redirect_to candidates_url, success: 'Candidate was successfully created.'
    else
      render :new
    end    
  end

  private

    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :cv_file)      
    end
end
