class TaskCandidate < ActiveRecord::Base
  belongs_to :task
  belongs_to :candidate
end
