class AccountRole < ActiveRecord::Base
    belongs_to :account
    belongs_to :role
end
