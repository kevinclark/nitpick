require File.join(File.dirname(__FILE__), *%w[.. lib nitpick])
$:.unshift File.dirname(__FILE__)

require 'spec'

Spec::Runner.configure do |config|
  def s(*args)
    Sexp.new(*args)
  end
end
