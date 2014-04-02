FactoryGirl.define do
    factory Account do
        username 'admin'
        password 'admin'
    end

    factory :account_admin, parent: Account do
        after(:build) do |account|
            account.roles << create(:role_admin)
        end
    end

    factory :account_manager, parent: Account do
        after(:build) do |account|
            account.roles << create(:role_accessr)
        end
    end

    factory :account_normal, parent: Account do
        after(:build) do |account|
            account.roles << create(:role_normal)
        end
    end

    factory :role_admin, class: Role do
        name 'admin'

        after(:build) do |role|
            role.permissions << create(:permission, action: 'access', subject: 'users')
            role.permissions << create(:permission, action: 'access', subject: 'roles')
            role.permissions << create(:permission, action: 'access', subject: 'permissions')
            role.permissions << create(:permission, action: 'access', subject: 'tasks')
        end
    end

    factory :role_accessr, class: Role do
        name 'admin'

        after(:build) do |role|
            role.permissions << create(:permission, action: 'access', subject: 'users')
            role.permissions << create(:permission, action: 'access', subject: 'tasks')
        end
    end

    factory :role_normal, class: Role do
        name 'admin'

        after(:build) do |role|
            role.permissions << create(:permission, action: 'access', subject: 'tasks')
        end
    end
    
    factory :permission do
    end

    factory :task do
        id '1'
        content 'tasks A.'
        account
    end
end
