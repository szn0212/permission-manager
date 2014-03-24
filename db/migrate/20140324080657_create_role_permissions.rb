# 存储角色与权限间的多对多关联
# 字段：
# => role_id 角色主键
# => permission_id 权限主键
class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
