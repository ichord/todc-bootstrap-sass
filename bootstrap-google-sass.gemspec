# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bootstrap-google-sass/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ichord"]
  gem.email         = ["chord.luo@gmail.com"]
  gem.description   = %q{google-bootstrap in sass for rails}
  gem.summary       = %q{google style for bootstrap}
  gem.homepage      = "https://github.com/ichord/bootstrap-google-sass"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bootstrap-google-sass"
  gem.require_paths = ["lib"]
  gem.version       = Bootstrap::Google::Sass::VERSION
end
