# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
    belongs_to :account

    validates :content, :account_id, presence: true
    validates :content, length: { maximum: 255 }
end
