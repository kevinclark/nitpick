require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/local_variable_badness'
require 'fixtures/block_badness'

include Fixtures

describe Nitpick::ArgumentNitpicker do
  it "should create warnings for an unreferenced argument" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :unused_arg)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UnusedArgument.new(:arg)]
  end
  
  it "should not create warnings for a referenced argument" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :used_arg)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not create warnings for splat args" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :used_splat_arg)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not create warnings when calling super with no explicit arguments" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :super_with_implicit_args)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should create warnings when calling super with explicit arguments" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :super_with_explicit_args)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UnusedArgument.new(:arg)]
  end
  
  it "should create warnings when calling super with explicit arguments but without referencing the passed arguments" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :super_with_explicit_args)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UnusedArgument.new(:arg)]
  end
  
  it "should not create warnings for args used with splats" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :args_used_with_splats)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should ignore [:block] arguments in args" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :default_args)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should handle &block in args when called" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :block_arg_called)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should handle &block in args when curried" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :block_arg_curried)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should warn when &block in args is unused" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :block_arg_unused)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UnusedArgument.new(:block)]
  end
  
  it "shouldn't warn on non-argument variables" do
    nitpicker = Nitpick::ArgumentNitpicker.new(LocalVariableBadness, :rescue_to_variable)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
end
