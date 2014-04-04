module Helpers
  def cancan_config(resource)
    session[:account] = create :account
    ability = Object.new.extend(CanCan::Ability)
    ability.can :manage, resource
    allow(controller).to receive(:current_ability).and_return(ability)
  end
end
