# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  action      :string(255)
#  subject     :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Permission < ActiveRecord::Base
  has_many :account_permissions
  has_many :accounts, :through => :account_permissions
  has_many :role_permissions
  has_many :roles, :through => :role_permissions

  validates :action, :subject, :description, presence: true
  validates :action, length: { maximum: 20 }
  validates :subject, length: { maximum: 20 }
  validates :description, length: { maximum: 20 }
end
