class Task < ActiveRecord::Base
  belongs_to :training_program
  has_many :task_candidate
  has_many :candidates, through: :task_candidate

  validates :title, :description, presence:true

  def completed_by?(candidate)
    task_candidate.where(candidate_id:candidate, task_id:id).exists?
  end
end
