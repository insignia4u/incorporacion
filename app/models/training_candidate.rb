class TrainingCandidate < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :training_program

  validates :candidate, :training_program, presence:true

  def completed?
    return true unless ended_on.blank?
    false
  end
end
