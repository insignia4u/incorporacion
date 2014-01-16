require 'spec_helper'

describe Task do
  describe "Associations" do
    it { should belong_to(:training_program) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
