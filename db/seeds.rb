# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

account = Account.create(username: 'admin', password: Digest::MD5.hexdigest('admin'))
User.create(nickname: 'Admin', sex: 1, account_id: account.id)

account = Account.create(username: 'allen', password: Digest::MD5.hexdigest('allen'))
User.create(nickname: 'Allen', sex: 1, account_id: account.id)

account = Account.create(username: 'philip', password: Digest::MD5.hexdigest('philip'))
User.create(nickname: 'Philip', sex: 1, account_id: account.id)

account = Account.create(username: 'lampard', password: Digest::MD5.hexdigest('lampard'))
User.create(nickname: 'Lampard', sex: 1, account_id: account.id)

admin = Role.create(name: 'admin')
manager = Role.create(name: 'manager')
employee = Role.create(name: 'employee')

permission = Permission.create(action: 'manage', subject: 'Task', description: '管理任务')
admin.permissions << permission
manager.permissions << permission
employee.permissions << permission

permission = Permission.create(action: 'read', subject: 'User', description: '管理用户')
admin.permissions << permission
manager.permissions << permission

permission = Permission.create(action: 'read', subject: 'User', description: '查看用户')
employee.permissions << permission

admin.save
manager.save
employee.save

Account.all.each do |account|
	Task.create(content: "Welcome, #{account.user.nickname}!", account_id: account.id)
end