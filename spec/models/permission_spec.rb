require 'spec_helper'

describe Permission do
  it { should validate_presence_of(:action) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:description) }
  it { should ensure_length_of(:action).is_at_most(20) }
  it { should ensure_length_of(:subject).is_at_most(20) }
  it { should ensure_length_of(:description).is_at_most(20) }
end
