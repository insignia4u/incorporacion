class CreateCandidateActions < ActiveRecord::Migration
  def change
    create_table :candidate_actions do |t|
      t.string :description
      t.belongs_to :action_category, index: true
      t.belongs_to :candidate, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
