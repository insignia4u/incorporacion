class Company < ActiveRecord::Base
  has_many :users
  has_many :candidates

  validates :name, presence: true, uniqueness: true
end
