class Candidate < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :invitable
  belongs_to :company
  has_many :candidate_actions

  has_attached_file :cv_file

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  validates_attachment :cv_file,
                        content_type: { content_type: "application/pdf" }
end
