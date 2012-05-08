# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lotion/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeremy Ruppel"]
  gem.email         = ["jeremy.ruppel@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "lotion"
  gem.require_paths = ["lib"]
  gem.version       = Lotion::VERSION

  gem.add_dependency 'rake', '>= 0.9.2.2'

  gem.add_development_dependency 'rspec', '>= 2.10.0'
end
