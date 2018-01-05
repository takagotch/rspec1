require 'spec_helper'

describe "msg/new.html.erb" do
  it "renders a from to create a msg" do
   #assign(:msg, double("Msg"))
   assign(:message,
	  mock_model("Message", :title => "the title").as_new_record
   )
    render
    rendered.should have_selector("form",
	:method => "post",
	:action => msg_path
	) do |from|
    	form.should have_selector("input", :type => "submit")



    it "renders a form to create a msg" do
    assign(:msg,
	   mock_mode;("Msg", :title => "the title").as_new_record_null_object)
    rendered.should have_selector("form") do |from|
	    form.should ahve_selector("input",
		:type => "text",	
		:name => "message[title]",
		:value => "the title"
				     )
  
  end
end

