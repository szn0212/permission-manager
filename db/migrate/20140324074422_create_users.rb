# 用户资料表，存储用户除了账号外的基本资料
# 字段：
# => account_id 关联账号
# => nickname 昵称
# => sex 性别
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
