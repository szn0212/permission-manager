# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  has_one :user
  has_many :account_roles
  has_many :roles, :through => :account_roles
  has_many :account_permissions
  has_many :permissions, :through => :account_permissions
  has_many :tasks

  validates :username, :password, presence: true
  validates :username, length: { minimum: 3, maximum: 10 }
end
