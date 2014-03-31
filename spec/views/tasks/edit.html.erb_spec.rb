require 'spec_helper'

describe "tasks/edit.html.erb" do
    it "render _form partial" do
        assign(:task, stub_model(Task))
        render
        expect(view).to render_template("_form")
    end
end
