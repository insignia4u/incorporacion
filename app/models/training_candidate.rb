class TrainingCandidate < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :training_program

  validates :candidate, :training_program, presence:true

  scope :completed, -> { where.not(ended_on:nil) }

  def completed?
    !ended_on.blank?
  end
end
