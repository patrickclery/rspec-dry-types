require 'dry/types'
require 'rspec/expectations'

module RSpec::Matchers
  module DryTypes
    extend RSpec::Matchers::DSL

    matcher :be_of_type do |expected, strict: false|
      # If you provide a string value, it will use dry-types,
      # if you provide anything else, it will use RSpec-expectations
      ref = expected.to_s.downcase
      ref = "coercible.#{ref}" unless strict or ref === 'nil'
      match do |actual|
        if Dry::Types.type_keys.include?(ref)
          constraint = Dry::Types[ref]
          constraint.valid?(actual)
        else
          # Super
          BuiltIn::BeAKindOf.new(expected).matches?(actual)
        end
      end
    end
    alias_method :be_a, :be_of_type
    alias_method :be_an, :be_of_type
    alias_method :be_a_kind_of, :be_of_type

    alias_matcher :be_of_type, :be_a
    alias_matcher :be_of_type, :be_a_kind_of
    alias_matcher :be_of_type, :be_an
  end
end
