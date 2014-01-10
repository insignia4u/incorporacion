class Company < ActiveRecord::Base
  has_many :users
  has_many :candidates
  has_many :action_categories
  has_many :training_programs

  validates :name, presence: true, uniqueness: true
end
