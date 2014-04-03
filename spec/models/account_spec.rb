require 'spec_helper'

describe Account do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:username).is_at_least(3) }
  it { should ensure_length_of(:username).is_at_most(10) }
end
