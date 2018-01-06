require 'spec_helper'

describe "msg/new.html.erb" do
  let(:msg) do
    mock_model("Msg").as_new_record.as_null_object
  end

  before do
    assign(:msg, msg)
  end

  it "renders a from to create a msg" do
   #assign(:msg, double("Msg"))
   #assign(:message,
#	  mock_model("Message", :title => "the title").as_new_record
#   )
    render
    rendered.should have_selector("form",
	:method => "post",
	:action => msg_path
	) do |from|
    	form.should have_selector("input", :type => "submit")
	end
  end

    it "renders a text field for the msg title" do
#    assign(:msg,
#	   mock_mode;("Msg", :title => "the title").as_new_record_null_object)
	render
	  rendered.should have_selector("form") do |from|
	    form.should have_selector("textarea",
	#	:type => "text",	
		:name => "message[text]",
		:value => "the msg"
    )  
  end
end

