# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'socicon/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'socicon-rails'
  spec.version       = Socicon::Rails::VERSION
  spec.authors       = ['Tim Maslyuchenko']
  spec.email         = ['insside@gmail.com']

  spec.summary       = %q{socicon + sprockets = <3}
  spec.description   = %q{an asset gemification of the socicon icon font library}
  spec.homepage      = 'http://socicon.com/'
  spec.license       = 'SIL Open Font License 1.1'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'railties', '>= 3.2'

  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'sass-rails'
end
