# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lotion/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeremy Ruppel"]
  gem.email         = ["jeremy.ruppel@gmail.com"]
  gem.description   = %q{Silky smooth helpers for RubyMotion}
  gem.summary       = %q{Silky smooth helpers for RubyMotion}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "lotion"
  gem.require_paths = ["lib"]
  gem.version       = Lotion::VERSION

  gem.add_dependency 'rake',         '>= 0.9.2.2'
  gem.add_dependency 'codependency', '>= 1.0.0'

  gem.add_development_dependency 'guard-motion', '0.1.1'
  gem.add_development_dependency 'rb-fsevent',   '~> 0.9.1'
  gem.add_development_dependency 'motion-stump', '0.2.0'
end
