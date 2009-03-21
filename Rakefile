require 'rake'
require 'spec/rake/spectask'

task :default => :spec

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "nitpick"
    gem.summary = %Q{A link-like static code analyzer for Ruby}
    gem.email = "kevin.clark@gmail.com"
    gem.homepage = "http://github.com/kevinclark/nitpick"
    gem.authors = ["Kevin Clark"]
    gem.rubyforge_project = 'nitpick'
    gem.add_dependency('trollop')
    gem.add_dependency('ParseTree', '~> 3.0.0')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'nitpick'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.spec_files = FileList['spec/**/*_spec.rb']
  spec.spec_opts = ["--format", "progress", "--color"]
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end
