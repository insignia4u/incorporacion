require 'spec_helper'

describe TrainingProgram do
  describe "Associations" do
    it { should have_many(:tasks) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
