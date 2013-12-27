class AddCompanyIdtoCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :company_id, :integer
    add_index :candidates, :company_id
  end
end
