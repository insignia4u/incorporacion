class Task < ActiveRecord::Base
  belongs_to :training_program
  has_many :task_candidate
  has_many :candidates, through: :task_candidate

  validates :title, :description, presence:true
end
