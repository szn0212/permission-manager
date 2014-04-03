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

require 'spec_helper'

describe User do
  it { should validate_presence_of(:nickname) }
  it { should validate_uniqueness_of(:nickname) }
  it { should ensure_length_of(:nickname).is_at_least(1) }
  it { should ensure_length_of(:nickname).is_at_most(10) }
  it { should validate_presence_of(:sex) }
  it { should ensure_inclusion_of(:sex).in_array([1,0]) }
end
