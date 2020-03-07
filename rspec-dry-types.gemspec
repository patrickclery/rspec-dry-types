lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rspec/dry/types/version"

Gem::Specification.new do |spec|
  spec.name    = "rspec-dry-types"
  spec.version = Rspec::Dry::Types::VERSION
  spec.authors = ["patrickclery"]
  spec.email   = ["patrick.clery@gmail.com"]

  spec.summary     = "Run your tests using Dry::Types for type expectations"
  spec.description = %q{Dry::Types for RSpec}
  spec.homepage    = "https://github.com/patrickclery/rspec-dry-types"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "dry-types", "~> 1.0"
  spec.add_dependency "rake", "~> 12.3.3"
  spec.add_dependency "rspec", "~> 3.8"
end
