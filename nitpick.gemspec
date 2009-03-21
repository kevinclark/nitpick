# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nitpick}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kevin Clark"]
  s.date = %q{2009-03-21}
  s.default_executable = %q{nitpick}
  s.email = %q{kevin.clark@gmail.com}
  s.executables = ["nitpick"]
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["VERSION.yml", "bin/nitpick", "lib/nitpick", "lib/nitpick/argument_nitpicker.rb", "lib/nitpick/block_nitpicker.rb", "lib/nitpick/branch_nitpicker.rb", "lib/nitpick/local_variable_counter.rb", "lib/nitpick/local_variable_nitpicker.rb", "lib/nitpick/method_nitpicker.rb", "lib/nitpick/nitpicker.rb", "lib/nitpick/rescue_nitpicker.rb", "lib/nitpick/sexp_extension.rb", "lib/nitpick/warnings", "lib/nitpick/warnings/assignment_as_condition.rb", "lib/nitpick/warnings/empty_method.rb", "lib/nitpick/warnings/identical_branch.rb", "lib/nitpick/warnings/rescue_everything.rb", "lib/nitpick/warnings/rescue_value.rb", "lib/nitpick/warnings/shadowed_variable.rb", "lib/nitpick/warnings/simple_warning.rb", "lib/nitpick/warnings/unprotected_block.rb", "lib/nitpick/warnings/unused_argument.rb", "lib/nitpick/warnings/unused_variable.rb", "lib/nitpick/warnings/useless_branch.rb", "lib/nitpick.rb", "spec/argument_nitpicker_spec.rb", "spec/assignment_as_condition_spec.rb", "spec/block_nitpicker_spec.rb", "spec/branch_nitpicker_spec.rb", "spec/fixtures", "spec/fixtures/block_badness.rb", "spec/fixtures/branch_badness.rb", "spec/fixtures/local_variable_badness.rb", "spec/fixtures/method_badness.rb", "spec/fixtures/rescue_badness.rb", "spec/local_variable_nitpicker_spec.rb", "spec/method_nitpicker_spec.rb", "spec/nitpicker_spec.rb", "spec/rescue_nitpicker_spec.rb", "spec/rescue_value_spec.rb", "spec/shadowed_variable_spec.rb", "spec/simple_warning_spec.rb", "spec/spec_helper.rb", "spec/useless_branch_spec.rb", "README", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/kevinclark/nitpick}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{nitpick}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A link-like static code analyzer for Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trollop>, [">= 0"])
      s.add_runtime_dependency(%q<ParseTree>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<trollop>, [">= 0"])
      s.add_dependency(%q<ParseTree>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<trollop>, [">= 0"])
    s.add_dependency(%q<ParseTree>, ["~> 3.0.0"])
  end
end
