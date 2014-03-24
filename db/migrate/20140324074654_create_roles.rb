# 角色表，一个用户会有至少一个角色，而一个角色会有至少一个权限
# 字段：
# => name 角色名
class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
