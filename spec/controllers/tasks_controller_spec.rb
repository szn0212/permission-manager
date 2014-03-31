require 'spec_helper'

describe TasksController do

    before :each do
        account = create :account
        allow(controller).to receive(:current_user) { account }
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
            get 'create', task: task
            expect(response).to redirect_to(Task.find(task[:id]))
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
        it "returns http success" do
            task = create :task
            get :destroy, id: task.id
            expect(response).to redirect_to(tasks_url)
        end
    end

end
