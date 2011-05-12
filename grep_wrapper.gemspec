# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "grep_wrapper/version"

Gem::Specification.new do |s|
  s.name        = "grep_wrapper"
  s.version     = GrepWrapper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Kozieł"]
  s.email       = ["adept_koza@o2.pl"]
  s.homepage    = ""
  s.summary     = %q{Simple gem to search and replace using grep comand line tool}
  s.description = %q{.}

  # s.rubyforge_project = "grep_wrapper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
