class Account < ActiveRecord::Base
	has_one :user
    has_many :account_roles
	has_many :roles, :through => :account_roles
    has_many :account_permissions
	has_many :permissions, :through => :account_permissions
	has_many :tasks
end
