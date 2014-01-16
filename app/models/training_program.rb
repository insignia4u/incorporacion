class TrainingProgram < ActiveRecord::Base
  belongs_to :company
  has_many :tasks
  has_many :training_candidate
  has_many :candidates, through: :training_candidate

  validates :name, presence:true
  validates :name, uniqueness:true

  accepts_nested_attributes_for :tasks,
    reject_if:lambda {|attr| attr['title'].blank?},
    allow_destroy:true

  def self.completed_by(candidate)
    candidate.training_programs.select {|program| program.completed_by?(candidate) }
  end

  def completed_by?(candidate)
    candidate.task_candidate.where(task_id: tasks).count === tasks.count
  end

  def task_completed(candidate)
    candidate.task_candidate.completed.count
  end
end
