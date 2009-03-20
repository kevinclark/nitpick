require 'yaml'

module Nitpick
  class Suppression < SexpProcessor
    # Load suppression data from a file
    def self.open(file)
      raise ArgumentError.new("No file #{file.inspect} found") unless File.exists?(file)
      self.new(File.read(file))
    end
    
    # Create a Suppression object from yaml
    def initialize(yaml)
      @rules = YAML.load(yaml)
    end
    
    def ==(other)
      @rules == other.rules
    end
    
    def suppress?(const)
      return true if @rules.any? { |rule| /^#{rule["constant"]}/ =~ const }
      
      false
    end
    
    protected
    
      def rules
        @rules
      end
  end
end
