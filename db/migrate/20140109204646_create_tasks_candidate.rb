class CreateTasksCandidate < ActiveRecord::Migration
  def change
    create_table :task_candidates do |t|
      t.belongs_to :candidate
      t.belongs_to :task
      t.datetime :completed_on
    end

    add_index :task_candidates, [:candidate_id, :task_id], unique:true, name:'index_task_candidate'
  end
end
