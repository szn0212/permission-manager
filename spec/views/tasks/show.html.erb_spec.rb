require 'spec_helper'

describe "tasks/show.html.erb" do
    it "displays the task" do
        assign(:task, stub_model(Task, content: 'Task A'))
        render
        expect(rendered).to include('Task A')
    end
end
