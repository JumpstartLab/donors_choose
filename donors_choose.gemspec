# -*- encoding: utf-8 -*-
require File.expand_path('../lib/donors_choose/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Steve Klabnik"]
  gem.email         = ["steve@steveklabnik.com"]
  gem.description   = %q{A gem to wrap the DonorsChoose.org API.}
  gem.summary       = %q{A gem to wrap the DonorsChoose.org API.}
  gem.homepage      = "http://github.com/jumpstartlab/donors_choose"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "donors_choose"
  gem.require_paths = ["lib"]
  gem.version       = DonorsChoose::VERSION

  gem.add_runtime_dependency "json"

  gem.add_development_dependency "rspec"
end
