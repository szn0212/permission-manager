# 存储用户的任务
# 字段：
# => content 任务内容
# => account_id 关联账号
class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :account_id

      t.timestamps
    end
  end
end
