# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gpa/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dustin Morrill"]
  gem.email         = ["dmorrill10@gmail.com"]
  gem.description   = %q{Academic course manipulation and GPA calculator}
  gem.summary       = %q{Academic course manipulation and GPA calculator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gpa"
  gem.require_paths = ["lib"]
  gem.version       = Gpa::VERSION
end
