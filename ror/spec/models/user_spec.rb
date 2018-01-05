require 'spec_helper'

describe User do
  
  describe "#send_msg" do
	  before(:each) do
	    #@zach = User.create!
	@zach = User.create! :subscription => Subscription.new
	    @david = User.create!
	  end

    context "when the user is over their subscription limit" do

	    before(:each) do
		    @zach.subscription = Subscription.new
		 #   @zach.subscription.stub(:can_send_msg?).and_return false
		    @zach.subscription.stub(:can_send_msg?).and_return true
	    end

	    describe "#canm_send_msg?" do
		    context "when a user has not reached the subscription limit for the month" do
	      it "return false"
	      end

		    context "when a user has reached the subscription limit for the month" do
	      it "return false"
	      end
	    end

	    it "does not create a msg" do
	    lambda{
		    @zach.send_msg(
		    :title => "Book Update",
		    :text => "Beta 11 includes great stuff",
		    :recipient => @david
		    )
	    }.should_not change(Msg, :count)
	    end

       it "sends a msg to another user" do
	       zach = User.create!
	       david = User.create!
       msg = zach.send_msg(
	       :title => "Book Update",
	       :text => "Beta 11 includes greate stuff!",
	   :recipient => david
	 )
	 david.received_msgs.should == [msg]
       end

       it "creates a new msg with the submitted attributes" do
         #zach = User.create!
	 #david = User.create!
	       msg = @zach.send_msg(
	       :title => "Book Update",
	       :text => "Beta 11 includes great stuff",
	       :recipient => @david
	       )
	       msg = zach.send_msg(
	   :title => "Book Update",
	   :text => "Beata 11 includes great stuff",
	   :recipient => david
	 )
	 msg.title.should == "Book Update"
	 msg.text.should == "Beta 11 includes grate stuff"
       end

       it "adds the msg to the sender's sent msgs" do
         zach = User.create!
	 david = User.create!
	 msg = zach.send_msg(
	   :title => "Book Update",
	   :text => "Beta 11 includes great stuff!",
	   :recipient => david
	 )
	 zach.sent_msgs.should == [msg]
       end
    end
  end

end

