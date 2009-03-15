module Dust
  class ArgumentDuster < LocalVariableCounter
    def dust!
      super
      
      @lvars.each do |name, details|
        next if details[:calls] > 0
        next if details[:uses] >= 2
        next if !@args.include?(name)
        warn Warnings::UnusedArgument.new(name)
      end
    end
  end
end
