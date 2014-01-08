class User < ActiveRecord::Base
  belongs_to :company
  has_many :candidate_actions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :company, :full_name, presence: true

  accepts_nested_attributes_for :company
end
