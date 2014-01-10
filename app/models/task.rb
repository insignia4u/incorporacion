class Task < ActiveRecord::Base
  belongs_to :training_program
  has_many :tasks_candidates
  has_many :candidates, through: :tasks_candidates

  validates :title, :description, presence:true
end
