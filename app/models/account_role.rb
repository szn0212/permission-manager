# == Schema Information
#
# Table name: account_roles
#
#  id         :integer          not null, primary key
#  account_id :integer
#  role_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class AccountRole < ActiveRecord::Base
    belongs_to :account
    belongs_to :role
end
