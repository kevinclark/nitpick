require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/rescue_badness'

include Fixtures

describe Nitpick::Warnings::RescueValue do

  it "should match rescuing to a nil" do
    warning = Nitpick::Warnings::RescueValue.new(nil, [:nil])
    warning.matches?.should be_true
  end
  
  it "should match rescuing to a lit" do
    warning = Nitpick::Warnings::RescueValue.new(nil, [:lit, 4])
    warning.matches?.should be_true
  end
  
  it "should not match with a rescue body" do
    exp = [nil,
             [:block,
              [:call, [:lit, 4], :+, [:array, [:lit, 5]]],
              [:call, [:lit, 6], :+, [:array, [:lit, 7]]]]]
              
    warning = Nitpick::Warnings::RescueValue.new(*exp)
    warning.matches?.should be_false
  end
end