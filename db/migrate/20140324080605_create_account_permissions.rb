# 存储账号和权限的多对多关联
# 字段：
# => account_id 账号主键
# => permission_id 权限主键
class CreateAccountPermissions < ActiveRecord::Migration
  def change
    create_table :account_permissions do |t|
      t.integer :account_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
