require 'spec_helper'

describe TrainingProgram do
  describe "Associations" do
    it { should have_many(:tasks) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'Completed' do
    before do
      mock_model(User)
      @program = create(:training_program_with_tasks)
      @program2 = create(:training_program_with_tasks)
      @candidate = create(:candidate_with_company)
      @candidate.training_programs << @program
      @candidate.tasks << @program.tasks
    end

    it { expect( @program.completed_by?(@candidate) ).to be_true }

    it "should not be completed if a task is incomplete" do
      @candidate.tasks = []
      expect( @program.completed_by?(@candidate) ).to be_false
    end

    it "should list all completed" do
      expect( TrainingProgram.completed_by(@candidate).count ).to eql(1)
    end

    it "should return task completed" do
      @candidate.tasks << @program2.tasks
      expect( @program.count_task_completed_by(@candidate) ).to eql(@program.tasks.count)
    end

    it "should return the porcent of completitud" do
      expect( @program.percent_of_completitud(@candidate) ).to eql(100)
    end

  end

  describe "Tasks" do
    before do
      @program = create(:training_program_with_tasks)
    end

    it { expect(@program.has_tasks?).to be_true }
  end
end
