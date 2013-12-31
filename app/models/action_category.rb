class ActionCategory < ActiveRecord::Base
  has_many :candidate_actions
  belongs_to :company

  validates :name, :company, presence: true
  validates :name, uniqueness: true
end
