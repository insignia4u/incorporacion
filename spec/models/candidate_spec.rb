require "spec_helper"

describe Candidate do
  describe "Associations" do
    it { should belong_to(:company) }
  end
  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should have_attached_file(:cv_file) }
    it { should validate_attachment_content_type(:cv_file).
                allowing('application/pdf') }
  end
end