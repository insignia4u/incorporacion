class CreateTasksCandidate < ActiveRecord::Migration
  def change
    create_table :tasks_candidates do |t|
      t.belongs_to :candidate
      t.belongs_to :task
      t.datetime :completed_on, default:DateTime.now
    end

    add_index :tasks_candidates, [:candidate_id, :task_id], unique:true, name:'index_task_candidate'
  end
end
