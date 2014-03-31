require 'spec_helper'

describe "tasks/index.html.erb" do
    it "displays the user's tasks" do
        assign(:tasks, [stub_model(Task,content: 'Task A'), stub_model(Task,content: 'Task B')])
        render
        expect(rendered).to include('Task A','Task B')
    end
end
