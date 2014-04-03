# == Schema Information
#
# Table name: account_permissions
#
#  id            :integer          not null, primary key
#  account_id    :integer
#  permission_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class AccountPermission < ActiveRecord::Base
    belongs_to :account
    belongs_to :permission
end
