require 'spec_helper'

describe RolesController do
  before :each do
    cancan_config Role
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      role = create :role
      get 'show', id: role.id
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
      role = create :role
      get 'edit', id: role.id
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      role = attributes_for :role
      expect {
        post 'create', role: role
      }.to change(Role, :count).by(1)
      expect(response).to redirect_to(Role.last)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      role = create :role
      role.name = '游客'
      get 'update', id: role.id, role: role.attributes
      role_updated = Role.find role.id
      expect(role_updated.name).to eq(role.name)
      expect(response).to redirect_to(role)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      role = create :role
      expect {
        delete 'destroy', id: role.id
      }.to change(Role, :count).by(-1)
      expect(response).to redirect_to(roles_url)
    end
  end

  describe "GET 'assign_permissions'" do
    context "when params is ok" do
      it "returns http success" do
        role_manager = create :role_manager
        expect {
          post 'assign_permissions', role_id: role_manager.id, news: "", deleteds: "#{role_manager.permissions.first.id},"
        }.to change(RolePermission, :count).by(-1)
        expect(response).to be_success
        expect(response.body).to match(/true/)
      end
    end

    context "when lost news param" do
      it "returns http success" do
        role_manager = create :role_manager
        expect {
          post 'assign_permissions', role_id: role_manager.id, news: nil, deleteds: "#{role_manager.permissions.first.id},"
        }.to change(RolePermission, :count).by(0)
        expect(response).to be_success
        expect(response.body).to match(/false/)
      end
    end
  end

  describe "GET 'permissions'" do
    it "returns http success" do
      role_manager = create :role_manager
      role_normal = create :role_normal
      ids = "#{role_manager.id},#{role_normal.id},"
      get 'permissions', ids: ids
      expect(response).to be_success
      expect(response.body).to match(/true/)
      role_manager.permissions.each do |p|
        expect(response.body).to match p.description
      end
      role_normal.permissions.each do |p|
        expect(response.body).to match p.description
      end
    end
  end

end
