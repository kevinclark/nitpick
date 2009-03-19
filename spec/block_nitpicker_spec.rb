require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/block_badness'

include Fixtures

describe Nitpick::BlockNitpicker do
  it "should warn when a yield is present without a conditional" do
    nitpicker = Nitpick::BlockNitpicker.new(BlockBadness, :no_conditional_for_block_given)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UnprotectedBlock.new]
  end
  
  it "should not warn when there is a check for block_given? before yield" do
    nitpicker = Nitpick::BlockNitpicker.new(BlockBadness, :simple_check_for_block_given)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should warn when there is a yield in a conditional without a block_given? check" do
    nitpicker = Nitpick::BlockNitpicker.new(BlockBadness, :simple_conditional_without_check)
    nitpicker.nitpick!
    nitpicker.warnings.size.should == 1
    nitpicker.warnings.first.should be_a_kind_of(Nitpick::Warnings::UnprotectedBlock)
  end
  
  it "should not warn when there is a check for block_given? in a complex conditional before yield" do
    nitpicker = Nitpick::BlockNitpicker.new(BlockBadness, :complex_conditional_with_check)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
end
