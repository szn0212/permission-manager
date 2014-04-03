# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "guest#{n}" }
  end

  factory :role_admin, class: Role do
    sequence(:name) { |n| "admin#{n}" }

    after(:build) do |role|
      role.permissions << create(:permission, action: 'manage', subject: 'User')
      role.permissions << create(:permission, action: 'manage', subject: 'Role')
      role.permissions << create(:permission, action: 'manage', subject: 'Permission')
      role.permissions << create(:permission, action: 'manage', subject: 'Task')
    end
  end

  factory :role_manager, class: Role do
    sequence(:name) { |n| "manager#{n}" }

    after(:build) do |role|
      role.permissions << create(:permission, action: 'manage', subject: 'User')
      role.permissions << create(:permission, action: 'manage', subject: 'Task')
    end
  end

  factory :role_normal, class: Role do
    sequence(:name) { |n| "normal#{n}" }

    after(:build) do |role|
      role.permissions << create(:permission, action: 'manage', subject: 'Task')
    end
  end
end
