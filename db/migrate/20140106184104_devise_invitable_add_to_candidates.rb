class DeviseInvitableAddToCandidates < ActiveRecord::Migration
  def up
    change_table :candidates do |t|
      t.string     :invitation_token
      t.datetime   :invitation_created_at
      t.datetime   :invitation_sent_at
      t.datetime   :invitation_accepted_at
      t.integer    :invitation_limit
      t.references :invited_by, :polymorphic => true
      t.index      :invitation_token, :unique => true
      t.index      :invited_by_id
    end

    change_column_null :candidates, :encrypted_password, true
  end

  def down
    change_table :candidates do |t|
      t.remove_references :invited_by, :polymorphic => true
      t.remove :invitation_limit, :invitation_sent_at, :invitation_accepted_at, :invitation_token, :invitation_created_at
    end
  end
end
