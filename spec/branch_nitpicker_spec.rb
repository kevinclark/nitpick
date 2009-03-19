require File.dirname(__FILE__) + '/spec_helper'
require 'fixtures/branch_badness'

include Fixtures

describe Nitpick::BranchNitpicker do
  it "should warn for a branch simply returning true and false" do
    nitpicker = Nitpick::BranchNitpicker.new(BranchBadness, :branch_returning_true_or_false)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::UselessBranch.new]
  end
  
  it "should warn for identical branches" do
    nitpicker = Nitpick::BranchNitpicker.new(BranchBadness, :branch_returning_identical_things)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::IdenticalBranch.new]
  end
  
  it "should warn for assignments as conditions" do
    nitpicker = Nitpick::BranchNitpicker.new(BranchBadness, :branch_with_assignment_as_condition)
    nitpicker.nitpick!
    nitpicker.warnings.should == [Nitpick::Warnings::AssignmentAsCondition.new]
  end
end
