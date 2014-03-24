# 权限表，存储权限。这个表结构的设计是为了和Cancan结合使用来实现权限管理
# 字段：
# => action 即controller的action,其中manage代表所有action,
#   read代表index、show,update指edit和update，create代表new和create
# => subject 即resource,一般情况下为Controller名字的前半部分单数形式，也即Model的名字
# => description 权限的描述，比如 :action => :manage, :subject => Task代表的权限是
#   拥有Task资源的增删改查所有权限，所以description可以写成管理任务，而 :action => :read,
#   :subject => Task表示只能查看用户，所以description就应该是查看任务。
#   description是用来在界面上做配置的时候供普通用户识别权限用的
class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
