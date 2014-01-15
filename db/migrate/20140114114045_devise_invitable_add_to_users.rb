class DeviseInvitableAddToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string     :invitation_token
      t.datetime   :invitation_created_at
      t.datetime   :invitation_sent_at
      t.datetime   :invitation_accepted_at
      t.integer    :invitation_limit
      t.datetime   :confirmed_at
      t.string     :confirmation_token
      t.datetime   :confirmation_sent_at
      t.string     :unconfirmed_email
      t.references :invited_by, polymorphic:true
      t.index      :invitation_token, unique:true # for invitable
      t.index      :invited_by_id
      t.index      :confirmation_token, unique:true
    end

    # And allow null encrypted_password and password_salt:
    change_column_null :users, :encrypted_password, true
  end

  def down
    change_table :users do |t|
      t.remove_references :invited_by, :polymorphic => true
      t.remove :invitation_limit, :invitation_sent_at, :invitation_accepted_at, :invitation_token, :invitation_created_at
      t.remove :confirmed_at
      t.remove :confirmation_token
      t.remove :confirmation_sent_at
      t.remove :unconfirmed_email
    end
  end
end
