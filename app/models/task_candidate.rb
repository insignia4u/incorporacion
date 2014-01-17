class TaskCandidate < ActiveRecord::Base
  belongs_to :task
  belongs_to :candidate

  scope :completed ,-> { where.not(completed_on: nil) }

  validates :completed_on, :task, :candidate, presence:true

  before_validation :set_default_complete_on

  private
    def set_default_complete_on
      self.completed_on = DateTime.now
    end
end
