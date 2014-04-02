FactoryGirl.define do
  factory :account do
    sequence :username do |n|
      "admin#{n}"
    end
    password Digest::MD5.hexdigest('admin')
  end

  factory :account_admin, parent: :account do
    after(:build) do |account|
      account.roles << create(:role_admin)
    end
  end

  factory :account_manager, parent: :account do
    after(:build) do |account|
      account.roles << create(:role_manager)
    end
  end

  factory :account_normal, parent: :account do
    after(:build) do |account|
      account.roles << create(:role_normal)
    end
  end

  factory :role_admin, class: Role do
    name 'admin'

    after(:build) do |role|
      role.permissions << create(:permission, action: 'manage', subject: 'User')
      role.permissions << create(:permission, action: 'manage', subject: 'Role')
      role.permissions << create(:permission, action: 'manage', subject: 'Permission')
      role.permissions << create(:permission, action: 'manage', subject: 'Task')
    end
  end

  factory :role_manager, class: Role do
    name 'admin'

    after(:build) do |role|
      role.permissions << create(:permission, action: 'manage', subject: 'User')
      role.permissions << create(:permission, action: 'manage', subject: 'Task')
    end
  end

  factory :role_normal, class: Role do
    name 'admin'

    after(:build) do |role|
      role.permissions << create(:permission, action: 'manage', subject: 'Task')
    end
  end

  factory :permission do
    sequence :id do |n|
      n
    end
    action 'manage'
    subject 'Task'
    description '管理任务'
  end

  factory :task do
    id '1'
    content 'Task A.'
    account
  end
end
