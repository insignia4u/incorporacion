class CreateActionCategories < ActiveRecord::Migration
  def change
    create_table :action_categories do |t|
      t.string :name
      t.belongs_to :company, index: true
      t.timestamps
    end

    add_index :action_categories, :name, unique: true
  end
end
