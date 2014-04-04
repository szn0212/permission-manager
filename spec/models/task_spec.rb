require 'spec_helper'

describe Task do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:account_id) }
  it { should ensure_length_of(:content).is_at_most(255) }
end
