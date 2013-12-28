# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gpa/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dustin Morrill"]
  gem.email         = ["dmorrill10@gmail.com"]
  gem.description   = %q{Academic course data manipulation and GPA calculation module}
  gem.summary       = %q{Academic course data manipulation and GPA calculation module}
  gem.homepage      = "https://github.com/dmorrill10/GPA"

  gem.add_dependency 'dmorrill10-utils', '~> 2.0.0'

  gem.add_development_dependency 'simplecov', '~> 0.8.2'
  gem.add_development_dependency 'minitest', '~> 5.2.0'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gpa"
  gem.require_paths = ["lib"]
  gem.version       = Gpa::VERSION
end
