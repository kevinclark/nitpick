module Fixtures
  class BranchBadness
    def branch_returning_true_or_false
      if 1 == 2
        true
      else
        false
      end
    end
    
    def branch_returning_identical_things
      if true
        1 + 2
      else
        1 + 2
      end
    end
    
    def branch_with_assignment_as_condition
      if a = 1
        1
      else
        2
      end
    end
  end
end
