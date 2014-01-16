class CreateTrainingCandidates < ActiveRecord::Migration
  def change
    create_table :training_candidates do |t|
      t.datetime :started_on, default: DateTime.now
      t.datetime :ended_on
      t.integer :training_program_id, index:true
      t.integer :candidate_id, index:true

      t.timestamps
    end

    add_index :training_candidates, [:training_program_id, :candidate_id], unique:true, name:'index_training_candidate'
  end
end
