class Candidate < ActiveRecord::Base
  belongs_to :company

  has_attached_file :cv_file

  validates :email, :first_name, :last_name, presence: true
  
  validates_attachment :cv_file,
    :content_type => { :content_type => "application/pdf" }
end
