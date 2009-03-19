require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/method_badness'

include Fixtures

describe Nitpick::MethodNitpicker do
  it "should create a warning for an empty method" do
    nitpicker = Nitpick::MethodNitpicker.new(MethodBadness, :empty_method)
    nitpicker.nitpick!
    nitpicker.warnings.include?(Nitpick::Warnings::EmptyMethod.new(:empty_method)).should be_true
  end
  
  it "should not create a empty method warning for a non empty method" do
    nitpicker = Nitpick::MethodNitpicker.new(MethodBadness, :non_empty_method)
    nitpicker.nitpick!
    nitpicker.warnings.any? {|w| w.is_a? Nitpick::Warnings::EmptyMethod }.should be_false
  end
end
