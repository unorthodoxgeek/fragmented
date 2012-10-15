# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fragmented/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tom Caspy"]
  gem.email         = ["tcaspy@gmail.com"]
  gem.description   = %q{fragment fetcher}
  gem.summary       = %q{fragment fetcher}
  gem.homepage      = "https://github.com/unorthodoxgeek/fragmented"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fragmented"
  gem.require_paths = ["lib"]
  gem.version       = Fragmented::VERSION
  gem.add_development_dependency(%q<rspec>, [">= 0"])
  gem.add_development_dependency(%q<rake>, ["~> 0.9.2"])
end
