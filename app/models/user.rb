# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  account_id :integer
#  nickname   :string(255)
#  sex        :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
    belongs_to :account

    validates :nickname, :sex, presence: true, uniqueness: true
    validates :nickname, length: { minimum: 1, maximum: 10 }
    validates :sex, inclusion: { in: [1,0] }
end
