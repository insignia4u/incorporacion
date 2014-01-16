require "spec_helper"

describe CandidateFeedService do
  before(:each) do
    @candidate = create(:candidate)
    @program = create(:training_program_with_tasks)
    @program2 = create(:training_program_with_tasks)
    @candidate.training_programs << @program
    @candidate.training_programs << @program2
    @candidate.tasks << @program.tasks
  end

  describe "Custom build with valid data" do
    before do
      @service = CandidateFeedService.build_with(@candidate)
    end

    it { expect(@service).not_to be_empty }
    it { expect(@service.count).to eql (1 + @program.tasks.count) }
    it { expect(@service.first[:completed_on]).to be >= @service.last[:completed_on] }
  end
end
