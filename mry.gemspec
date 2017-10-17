# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mry/version'

Gem::Specification.new do |spec|
  spec.name          = "mry"
  spec.version       = Mry::VERSION
  spec.authors       = ["Masataka Kuwabara"]
  spec.email         = ["kuwabara@pocke.me"]

  spec.summary       = %q{Mry Migrates .Rubocop.Yml}
  spec.description   = %q{Mry Migrates .Rubocop.Yml}
  spec.homepage      = "https://github.com/pocke/mry"
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_runtime_dependency 'rubocop', '>= 0.41.0'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 5'
  spec.add_development_dependency "minitest-power_assert", "~> 0.2.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'rubocop', '0.50.0'
  spec.add_development_dependency 'meowcop', '1.12.1'
end
