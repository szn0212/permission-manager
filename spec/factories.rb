FactoryGirl.define do
    factory :account do
        username 'admin'
        password 'admin'
    end

    factory :task do
        id '1'
        content 'Task A.'
        account
    end
end
