require 'spec_helper'

describe Msg do
  before(:each) do
    @message = Message.new(:title => "foo", :text => "bar", :recipient => mock_model("User"))
  end

  it "is valid with valid attributes" do
    Msg.new.should be_valid
   #Msg.new(:title => "foo", :text => "bar").should be_valid
  end

  it "is not valid without a title" do
   #msg = Msg.new :title => nil
    msg = Msg.new = nil
    msg.should_not be_valid
  end

  it "is not valid without text" do
    msg = Msg.new :text => nil, :title => "foo"
    msg.should_not be_valid
  end

  it "is not valid without a reciplent" do
    #Msg.new(:title => "foo", :text => "bar").should be_valid
    @msg.recipient = nil
    @msg.should_not be_valid
  end
end


