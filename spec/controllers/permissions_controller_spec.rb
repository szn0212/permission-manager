require 'spec_helper'

describe PermissionsController do
  before(:each) do
    session[:account] = create :account
    ability = Object.new.extend(CanCan::Ability)
    ability.can :manage, Permission
    allow(controller).to receive(:current_ability).and_return(ability)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      permission = create :permission
      get 'show', id: permission.id
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      permission = create :permission
      get 'edit', id: permission.id
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      permission = attributes_for :permission
      expect {
        post 'create', permission: permission
      }.to change(Permission, :count).by(1)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      permission = create :permission
      permission.action = 'read'
      post 'update', id: permission.id, permission: permission.attributes
      permission_updated = Permission.find permission.id
      expect(permission_updated.action).to eq(permission.action)
      expect(response).to redirect_to(permission)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      permission = create :permission
      expect {
        delete 'destroy', id: permission.id
      }.to change(Permission, :count).by(-1)
      expect(response).to redirect_to(permissions_url)
    end
  end

end
