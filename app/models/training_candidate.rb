class TrainingCandidate < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :training_program

  validates :candidate_id, uniqueness: { scope: [:training_program_id],
                        message: 'should assigned one time' }

  scope :completed, -> { where.not(ended_on:nil) }

  def completed?
    !ended_on.blank?
  end
end
