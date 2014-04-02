require 'spec_helper'

describe TasksController do

  before :each do
    session[:account] = create :account
    ability = Object.new.extend(CanCan::Ability)
    ability.can :manage, Task
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
      task = create :task
      get 'show',id: task.id
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
      task = create :task
      get 'edit',id: task.id
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      task = attributes_for :task
      post 'create', task: task
      task = Task.find_by_id task[:id]
      expect(task).not_to be_nil
      expect(response).to redirect_to(task)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      task = create :task
      task.content = 'Task A - 1.'
      post 'update',id: task.id, task: task.attributes
      task_updated = Task.find task.id
      expect(task_updated.content).to eq(task.content)
      expect(response).to redirect_to(task)
    end
  end

  describe "DELETE 'destroy'" do
    it "delete the task record by id param" do
      task = create :task
      delete :destroy, id: task.id
      expect(Task.find_by_id task.id).to be_nil
      expect(response).to redirect_to(tasks_url)
    end
  end

end
