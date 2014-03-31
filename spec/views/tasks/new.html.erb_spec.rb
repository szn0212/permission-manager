require 'spec_helper'

describe "tasks/new.html.erb" do
    it "renders _form partial" do
        assign(:task, stub_model(Task))
        render
        expect(view).to render_template(partial: '_form')
    end
end
