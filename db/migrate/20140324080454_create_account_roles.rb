# 存储账号和角色之间的多对多关联
# 字段：
# => account_id 账号主键
# => role_id 角色主键
class CreateAccountRoles < ActiveRecord::Migration
  def change
    create_table :account_roles do |t|
      t.integer :account_id
      t.integer :role_id

      t.timestamps
    end
  end
end
