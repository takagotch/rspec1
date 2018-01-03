shared_eacmples_for "any pizza" do
  it "tastes really good" do
    @pizza.should taste_really_good
  end

  it "is available by the slice" do
    @pizza.should be_available_by_the_slice
  end
end

describe "New York style thin crust pizza" do
  before(:each) do
    @pizza = Pizza.new(:region => 'New York', :style => 'thin crust')
  end

  it_behaves_like "any pizza"

  it "has a really great sauce" do
    @pizza.should have_a_really_great_sauce
  end
end

describe "Chicago style stuffed pizza" do
  before(:each) do
    @pizza = Pizza.new(:region => 'Chicago', :style => 'stuffed')
  end

  it_behaves_like "any pizza"

  it "has a ton of cheese" do
    @pizza.should  have_a_ton_of_cheese
  end
end

