require 'spec_helper'

describe "msgs/show.html.erb" do
  it "display the next attribute of msg" do
    assign(:message, double("Msg", :text => "Hello"))
    render
    rendered.should contain("Hello!")
  end
end

