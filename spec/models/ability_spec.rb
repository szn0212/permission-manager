require 'spec_helper'
require 'cancan/matchers'

describe Ability do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is an admin" do
        let(:user){ create(:account_admin) }
        it{ should be_able_to(:manage, User.new) }
        it{ should be_able_to(:manage, Role.new) }
        it{ should be_able_to(:manage, Permission.new) }
        it{ should be_able_to(:manage, Task.new) }
    end

    context "when is a manager " do
        let(:user){ create(:account_manager) }
        it{ should be_able_to(:manage, User.new) }
        it{ should_not be_able_to(:read, Role.new) }
        it{ should_not be_able_to(:read, Permission.new) }
        it{ should be_able_to(:manage, Task.new) }
    end

    context "when is a normal user " do
        let(:user){ create(:account_normal) }
        it{ should be_able_to(:manage, Task.new) }
        it{ should_not be_able_to(:read, User.new) }
        it{ should_not be_able_to(:read, Role.new) }
        it{ should_not be_able_to(:read, Permission.new) }
    end
end
