class CreateAccountPermissions < ActiveRecord::Migration
  def change
    create_table :account_permissions do |t|
      t.integer :account_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
