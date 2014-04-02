# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

account_admin = Account.create(username: 'admin', password: Digest::MD5.hexdigest('admin'))
User.create(nickname: 'Admin', sex: 1, account_id: account_admin.id)

account_allen = Account.create(username: 'allen', password: Digest::MD5.hexdigest('allen'))
User.create(nickname: 'Allen', sex: 1, account_id: account_allen.id)

account_philip = Account.create(username: 'philip', password: Digest::MD5.hexdigest('philip'))
User.create(nickname: 'Philip', sex: 1, account_id: account_philip.id)

account_lampard = Account.create(username: 'lampard', password: Digest::MD5.hexdigest('lampard'))
User.create(nickname: 'Lampard', sex: 1, account_id: account_lampard.id)

admin = Role.new(name: 'admin')
manager = Role.new(name: 'manager')
employee = Role.new(name: 'employee')

permission = Permission.new(action: 'access', subject: 'permissions', description: '管理权限')
admin.permissions << permission
permission = Permission.new(action: 'access', subject: 'roles', description: '管理角色')
admin.permissions << permission

permission = Permission.new(action: 'access', subject: 'tasks', description: '管理任务')
admin.permissions << permission
manager.permissions << permission
employee.permissions << permission

permission = Permission.new(action: 'access', subject: 'users', description: '管理用户')
admin.permissions << permission
manager.permissions << permission

permission = Permission.new(action: 'read', subject: 'users', description: '查看用户')
employee.permissions << permission

admin.save
manager.save
employee.save

permission = Permission.new(action: 'update', subject: 'users', description: '编辑用户')
account_allen.permissions << permission

account_admin.roles << admin
account_admin.save
account_allen.roles << employee
account_allen.save
account_lampard.roles << employee
account_lampard.save
account_philip.roles << manager
account_philip.save

Account.all.each do |account|
	Task.create(content: "Welcome, #{account.user.nickname}!", account_id: account.id)
end
