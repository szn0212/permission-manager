class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :account_id
      t.string :nickname
      t.integer :sex

      t.timestamps
    end
  end
end
