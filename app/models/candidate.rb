class Candidate < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :invitable
  belongs_to :company
  has_many :candidate_actions
  has_many :task_candidate
  has_many :tasks, through: :task_candidate
  has_many :training_candidate
  has_many :training_programs, through: :training_candidate

  has_attached_file :cv_file

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  validates_attachment :cv_file,
                        content_type: { content_type: "application/pdf" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def complete_training_program?(training_program)
    task_candidate.completed(training_program.id).count === training_program.tasks.count
  end

  def completed_tasks(program_id)
    task_candidate.completed(program_id)
  end

  def company_users
    company.users
  end
end
