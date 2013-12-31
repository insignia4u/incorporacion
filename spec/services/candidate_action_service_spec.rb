require "spec_helper"

describe CandidateActionService do
  before(:each) do
    @user = create(:user)
    @company = @user.company
    @candidate = create(:candidate)
    @params = { category_name: 'Category Name', description: 'A description' }
  end

  describe "Validations" do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:candidate) }
    it { should validate_presence_of(:category_name) }
    it { should validate_presence_of(:user) }
  end

  describe "Custom build with valid data" do
    before do
      @service = CandidateActionService.build_with(@params, @user, @candidate)
    end

    it { expect(@service).to be_valid }
  end

  describe "Custom build with invalid data" do
    before do
      @service = CandidateActionService.build_with({}, @user, @candidate)
    end

    it { expect(@service).not_to be_valid }
  end

  describe "Save" do
    before do
      @service = CandidateActionService.build_with(@params, @user, @candidate)
      @service.save
      @action = ActionCategory.where(name: @params[:category_name]).first
    end

    it { expect( ActionCategory.where(name: @params[:category_name]) ).to exist }
    it { expect( @action.company ).to eql(@user.company) }
    it { expect( @action.candidate_actions.where(description: @params[:description])).to exist }
  end
end
