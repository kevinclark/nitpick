require File.dirname(__FILE__) + '/spec_helper'

describe Nitpick::Suppression do
  before do
    @supp_file = File.join(File.dirname(__FILE__), *%w[fixtures suppressions.yaml])
    @supp = Nitpick::Suppression.new(File.read(@supp_file))
  end
  
  it "should open options from a file" do
    Nitpick::Suppression.open(@supp_file).should == @supp
  end
  
  it "should suppress based on a constant" do
    @supp.suppress?("Sinatra").should be_true
    @supp.suppress?("Object").should be_false
  end
end