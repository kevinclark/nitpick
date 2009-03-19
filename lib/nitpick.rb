$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'parse_tree'
require 'ruby2ruby'

require 'nitpick/warnings/simple_warning'
require 'nitpick/warnings/unused_variable'
require 'nitpick/warnings/unprotected_block'
require 'nitpick/warnings/useless_branch'
require 'nitpick/warnings/identical_branch'
require 'nitpick/warnings/rescue_value'
require 'nitpick/warnings/rescue_everything'
require 'nitpick/warnings/unused_argument'
require 'nitpick/warnings/assignment_as_condition'
require 'nitpick/warnings/shadowed_variable'
require 'nitpick/warnings/empty_method'

require 'nitpick/nitpicker'
require 'nitpick/local_variable_counter'
require 'nitpick/local_variable_nitpicker'
require 'nitpick/argument_nitpicker'
require 'nitpick/block_nitpicker'
require 'nitpick/branch_nitpicker'
require 'nitpick/rescue_nitpicker'
require 'nitpick/method_nitpicker'


require 'nitpick/sexp_extension'
class Sexp
  include Nitpick::SexpExtension
end
