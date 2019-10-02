require "bundler/setup"
require 'rspec'
require 'rspec/support'
RSpec::Support.require_rspec_support 'matcher_definition'
RSpec::Support.define_optimized_require_for_rspec(:matchers) { |f| require_relative(f) }
#
# %w[
#   english_phrasing
#   composable
#   built_in
#   generated_descriptions
#   dsl
#   matcher_delegator
#   aliased_matcher
#   expecteds_for_multiple_diffs
# ].each { |file| RSpec::Support.require_rspec_matchers(file) }

require 'dry-types'
require "rspec/dry/types"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
