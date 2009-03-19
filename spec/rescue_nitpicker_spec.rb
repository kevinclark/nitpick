require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/rescue_badness'

include Fixtures

describe Nitpick::RescueNitpicker do
  it "should create a warning for rescuing to a value" do
    nitpicker = Nitpick::RescueNitpicker.new(RescueBadness, :rescue_nil)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::RescueValue.new]
  end
  
  it "should create a warning for rescuing Exception" do
    nitpicker = Nitpick::RescueNitpicker.new(RescueBadness, :rescue_exception)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::RescueEverything.new]
  end
  
  it "should create a warning for rescuing Object" do
    nitpicker = Nitpick::RescueNitpicker.new(RescueBadness, :rescue_object)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::RescueEverything.new]
  end
   
end
