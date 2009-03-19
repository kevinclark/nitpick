require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/local_variable_badness'

include Fixtures

describe Nitpick::LocalVariableNitpicker do
  it "should increment uses for an lasgn node" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :unused_lasgn)
    nitpicker.nitpick!
    nitpicker.uses(:bar).should == 1
  end
  
  it "should increment uses for an lvar node" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :used_lvar)
    nitpicker.nitpick!
    nitpicker.uses(:bar).should == 2 # lvar + lasgn
  end
  
  it "should create warnings for an an assigned but unused local variable" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :unused_lasgn)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UnusedVariable.new(:bar)]
  end
  
  it "should not create warnings for used local variables" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :used_lvar)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not create warnings for local variables with calls" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :lvar_with_call)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not create warnings for local variables with iasgns" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :lvar_with_iasgn)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not create warnings for arguments with iasgns" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :arg_with_iasgn)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should warn when a block variable shadows a local variable" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :lvar_shadowed)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::ShadowedVariable.new(:x)]
  end
  
  it "should warn when a block variable (among many) shadows a local variable" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :lvar_shadowed_many_block_vars)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::ShadowedVariable.new]
  end
  
  it "should not warn when a block variable does not shadow a local variable" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :lvar_not_shadowed)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not warn when a block arg is referenced" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :block_arg_curried)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not warn when splat args are used with splats" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :splat_args_used_with_splat)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "should not warn about unused args" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :simple_unused_arg)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
  
  it "shouldn't barf on anonymous splat args" do
    nitpicker = Nitpick::LocalVariableNitpicker.new(LocalVariableBadness, :anonymous_args)
    nitpicker.nitpick!
    nitpicker.warnings.should == []
  end
end