require 'spec_helper'

describe LoginController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "user login" do

    context "correct username and password" do
      it "login success" do
        account = create :account
        post 'login', username: account.username, password: 'admin'
        expect(session[:account]).not_to be_nil
        expect(response).to redirect_to(controller: 'tasks', action: 'index')
      end
    end

    context "incorrect password" do
      it "login failure" do
        account = create :account
        post 'login', username: account.username, password: 'lalala'
        expect(session[:account]).to be_nil
        expect(response).to redirect_to(action: 'index')
      end
    end

    context "incorrect username" do
      it "login failure" do
        account = create :account
        post 'login', username: 'lalala', password: 'admin'
        expect(session[:account]).to be_nil
        expect(response).to redirect_to(action: 'index')
      end
    end
  end

  describe "user logout" do
    it "returns http success" do
      get 'logout'
      expect(session[:account]).to be_nil
      expect(response).to redirect_to(action: 'index')
    end
  end

end
