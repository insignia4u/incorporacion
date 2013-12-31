require "spec_helper"

describe CandidateAction do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:action_category) }
    it { should belong_to(:candidate) }
  end

  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:candidate) }
    it { should validate_presence_of(:action_category) }
    it { should validate_presence_of(:description) }
  end
end
