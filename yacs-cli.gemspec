# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yacs/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "yacs-cli"
  spec.version       = Yacs::Cli::VERSION
  spec.authors       = ["Richie"]
  spec.email         = ["richiejoeyoung@gmail.com"]

  spec.summary       = %q{A Command Line Interface for the YACS API}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/YACS-RCOS/yacs-cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables = 'yacs'
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "rspec", "~> 3.0"
end
