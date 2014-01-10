class CreateTrainingPrograms < ActiveRecord::Migration
  def change
    create_table :training_programs do |t|
      t.string :name
      t.integer :company_id, index:true

      t.timestamps
    end
  end
end
