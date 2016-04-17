# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_convert/version'

Gem::Specification.new do |spec|
  spec.name          = "date_convert"
  spec.version       = DateConvert::VERSION
  spec.authors       = ["Chris Miklius"]
  spec.email         = ["cmiklius@gmail.com"]

  spec.summary       = %q{Convert dates to ISO 8601 format}
  spec.description   = %q{Convert dates to ISO 8601 format}
  spec.homepage      = "https://github.com/ChrisMIX/CodeFoo6Application/tree/master/date_convert"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
