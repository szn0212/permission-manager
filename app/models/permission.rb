class Permission < ActiveRecord::Base
  has_many :account_permissions
  has_many :accounts, :through => :account_permissions
	has_many :role_permissions
	has_many :roles, :through => :role_permissions
end
