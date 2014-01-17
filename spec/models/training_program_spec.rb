require 'spec_helper'

describe TrainingProgram do
  describe "Associations" do
    it { should have_many(:tasks) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'Completition of it' do
    before do
      @program = create(:training_program_with_tasks)
      @program2 = create(:training_program_with_tasks)
      @candidate = create(:candidate)
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

  end
end
