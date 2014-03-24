class CreateAccountRoles < ActiveRecord::Migration
  def change
    create_table :account_roles do |t|
      t.integer :account_id
      t.integer :role_id

      t.timestamps
    end
  end
end
