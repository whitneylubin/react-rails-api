lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'react-rails-api/version'

Gem::Specification.new do |spec|
  spec.name          = 'react-rails-api'
  spec.version       = ReactRailsAPI::VERSION
  spec.authors       = ['Edwin Onuonga', 'Charlie Gleason']
  spec.email         = ['edwinonuonga@gmail.com', 'hi@charliegleason.com']
  spec.license       = 'MIT'

  spec.summary       = %q{All-in-one application generator enabling the integration of a React front-end and a Ruby-on-Rails API back-end with ActiveAdmin CMS.}
  spec.homepage      = 'https://github.com/eonu/react-rails-api'

  spec.files         = Dir.glob('lib/**/*', File::FNM_DOTMATCH) + %w[Gemfile LICENSE README.md react-rails-api.gemspec bin/react-rails]
  spec.bindir        = 'bin'
  spec.executables   = 'react-rails'
  spec.require_paths = ['lib']

  spec.required_ruby_version = "~> 2.5"

  spec.add_runtime_dependency 'thor', '~> 0.20'
  spec.add_runtime_dependency 'rails', '~> 5.2'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3'

  spec.metadata = {'source_code_uri' => spec.homepage}
end
