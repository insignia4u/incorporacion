class CandidatesController < ApplicationController
  before_filter :set_candidate, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  
  def new
    @candidate = Candidate.new
  end

  def edit
  end

  def show
  end

  def create
    company = Company.find(current_user.company)
    @candidate = Candidate.new(candidate_params)
    @candidate.company = company

    respond_to do |format|
      if @candidate.save
        flash[:success] = 'Candidate was successfully created.'
        format.html { redirect_to candidates_url }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate,
                      notice: 'Candidate was successfully updated.'}
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url }
    end
  end

  private

    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :cv_file)      
    end
end
