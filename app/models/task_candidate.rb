class TaskCandidate < ActiveRecord::Base
  belongs_to :task
  belongs_to :candidate

  def self.completed( id = nil )
    return where.not(completed_on: nil) unless id
    joins(:task).where('tasks.training_program_id = ?',id)
                .where.not(completed_on: nil)
  end

  validates :completed_on, :task, :candidate, presence:true

  before_validation :set_default_complete_on
  after_save :send_emails

  private
    def set_default_complete_on
      self.completed_on = DateTime.now
    end

    def send_emails
      if candidate.complete_training_program?(task.training_program)
        ProgramTrainingMailer.delay.completed_program(candidate,task.training_program)
      end
    end
end
