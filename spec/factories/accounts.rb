# Read about factories at https://github.com/thoughtbot/factory_girl

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
end
