class AccountPermission < ActiveRecord::Base
    belongs_to :account
    belongs_to :permission
end
