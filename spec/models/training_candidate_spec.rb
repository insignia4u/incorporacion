require 'spec_helper'

describe TrainingCandidate do
  describe "Validations" do
    it { should validate_presence_of(:candidate) }
    it { should validate_presence_of(:training_program) }
  end

  describe "it when was created" do
    before do
      @training = create(:training_candidate)
    end

    it { expect(@training.started_on.blank?).to eql false }
  end

  describe "it when was completed" do
    before do
      @training = create(:training_candidate)
    end

    it { expect(@training.completed?).to eql true }
  end
end
