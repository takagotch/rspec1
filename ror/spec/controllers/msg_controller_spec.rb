require 'spec_helper'

describe MessagesController do
  describe "POST create" do
	let(:msg) { mock_model(Msg).as_null_object }

	before do 
	  Msg.stub(:new).and_return(msg)
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
  end
end

