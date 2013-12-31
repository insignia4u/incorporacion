class CandidateAction < ActiveRecord::Base

  belongs_to :user
  belongs_to :action_category
  belongs_to :candidate

  validates :user, :candidate, :description, :action_category, presence: true

end
