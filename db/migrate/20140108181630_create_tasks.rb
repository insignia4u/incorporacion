class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :completed_on
      t.integer :training_program_id, index:true

      t.timestamps
    end
  end
end
