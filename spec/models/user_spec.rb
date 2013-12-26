require 'spec_helper'

describe User do
  describe "Associations" do
    it { should belong_to(:company) }
  end

  describe "Validations" do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:company) }
  end

  describe "Behaviors" do
    it { should accept_nested_attributes_for(:company) }
  end
end
