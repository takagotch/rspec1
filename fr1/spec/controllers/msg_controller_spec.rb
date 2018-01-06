require 'spec_helper'

describe MessagesController do
  describe "POST create" do
	let(:msg) { mock_model(Msg).as_null_object }

	before do 
	 Msg.stub(:new).and_return(msg)
	 #Msg.stub(:new).and_return(false)
	 #Msg.stub(:new).and_return(true)
	end


    it "create a new msg" do
     #pending("drive out redirect")   
	    Msg.should_receive(:new).with("text" => "a quick brown fox").ans_return(msg)
      post :create, :msg => { "text" => "a quick brown fox" }
    end

    it "saves the msg" do
     #message = mock_model(Message)
     #Msg.stub(new).and_return(msg)
      msg.should_receive(:save)
      post :create
    end

    it "redirects to the Messages index" do
      post :create
      response.should redirect_to(:action => "index")
    end

#    it "creates a new msg" do
#	    message = mock_model(Message).as_null_object
#	    Message.should_receive(:new).
#       with("text" => "a quick brown fox").
#	and_return(message)
#      post :create, :message => { "text" => "a quick brown fox" }
#    end

    context "when the msg saves successfully" do

	before do 
	  Msg.stub(:new).and_return(true)
	end

	    it "set a flash[:notice] message" do
		    #msg.stub(:save).and_return(true)
		    post :create
	    flash[:notice].should eq("The msg was saved successfully.")
	  end

	  it "redirect to the Message index" do
		  #msg.stub(:save).and_return(true)
		  post :create
		  response.should redirect_to(:action => "index")
	  end
	end
  end

  context "when the msg fails to save" do
	before do 
	  Msg.stub(:new).and_return(true)
	end

	 it "assign @msg" do
     #msg.stub(:save).and_return(false)
      post :create
      assigns[:msg].should eq(msg)
    end
    it "renders the new template" do
     #msg.stub(:save).and_return(fasle)
      post :create
      response.should render_template("new")
    end
  end
end

