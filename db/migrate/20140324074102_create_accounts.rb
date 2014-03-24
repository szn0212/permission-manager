# 账号表，存储用户账号
# 字段：
# => username 用户名
# => password 加密密码
class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
