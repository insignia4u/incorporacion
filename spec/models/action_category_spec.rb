require 'spec_helper'

describe ActionCategory do
  describe "Associations" do
    it { should have_many(:candidate_actions) }
    it { should belong_to(:company) }
  end
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:company) }
    it { should validate_uniqueness_of(:name) }
  end
end
