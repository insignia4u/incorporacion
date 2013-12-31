class Company < ActiveRecord::Base
  has_many :users
  has_many :candidates
  has_many :action_categories

  validates :name, presence: true, uniqueness: true
end
