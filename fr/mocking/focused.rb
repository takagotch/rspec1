RSpec.congigure do |c|
  c.filter = { :focus => true }
  c.exclusion_filter = { :slow => true }
end

describe "group1" do
  it "ex1", :focus => true do
  end

  it "ex2", :slow => true do
  end
end

describe "group2" do
  it "ex3" do
  end

  it "ex4" do
  end
end

