require 'spec_helper'

describe UsersController do
  before :each do
    cancan_config User
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      user = create :user
      get 'show', id: user.id
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
      user = create :user
      get 'edit', id: user.id
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      user = attributes_for :user
      post 'create', user: user
      user = User.find_by_id user[:id]
      expect(user).not_to be_nil
      expect(response).to redirect_to(user)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      user = create :user
      user.sex = 0
      post 'update', id: user.id, user: user.attributes
      user_updated = User.find user.id
      expect(user_updated.sex).to eq(user.sex)
      expect(response).to redirect_to(user)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      user = create :user
      delete 'destroy', id: user.id
      expect(User.find_by_id user.id).to be_nil
      expect(response).to redirect_to(users_url)
    end
  end

  describe "POST 'assign_roles'" do
    context "when params is ok" do
      it "assign roles successfully" do
        account_admin = create :account_admin
        user = create :user, account: account_admin
        role_manager = create :role_manager
        expect {
          post 'assign_roles', user_id: user.id, news: "#{role_manager.id},", deleteds: ""
        }.to change(AccountRole, :count).by(1)
        expect(response).to be_success
        expect(response.body).to match(/true/)
      end
    end

    context "when lost user_id param" do
      it "assign roles failure" do
        account_admin = create :account_admin
        user = create :user, account: account_admin
        role_manager = create :role_manager
        expect {
          post 'assign_roles', news: "#{role_manager.id},", deleteds: ""
        }.to change(AccountRole, :count).by(0)
        expect(response).to be_success
        expect(response.body).to match(/false/)
      end
    end
  end

end
