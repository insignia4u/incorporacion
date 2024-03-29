require 'spec_helper'

describe Company do
  describe "Associations" do
    it { should have_many(:users) }
    it { should have_many(:candidates) }
    it { should have_many(:action_categories) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
