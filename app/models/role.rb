# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
	has_many :role_permissions
	has_many :permissions, :through => :role_permissions

  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }
end
