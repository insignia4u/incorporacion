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
    count_task_completed_by(candidate) === tasks.count
  end

  def count_task_completed_by(candidate)
    candidate.completed_tasks(id).count
  end

  def has_tasks?
    tasks.any?
  end

  def percent_of_completitud(candidate)
    count_task_completed_by(candidate)*100 / tasks.count
  end
end
