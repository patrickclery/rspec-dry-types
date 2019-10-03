require 'dry/types'
require 'rspec/expectations'

module RSpec::Matchers
  module DryTypes
    extend RSpec::Matchers::DSL

    matcher :be_of_type do |expected, strict: true|
      match do |actual|
        if expected.kind_of?(Dry::Types::Type)
          constraint = expected
        elsif expected.kind_of?(Symbol)
          if [:string, :integer, :float, :nil, :symbol, :array, :hash].include?(expected)
            key = "#{ strict ? 'strict' : 'coercible'}.#{expected.to_s}"
            begin
              constraint = Dry::Types[key]
            rescue
              raise ::ArgumentError, "`be_of_type` invalid symbol"
            end
          end
        else
          raise ::ArgumentError, "The `be_of_type` matcher requires either " \
                                 "a Dry::Types::Type or a symbol that references " \
                                 "a Dry::Types::Type"
        end

        # If the constraint throws an error, return false
        begin
          constraint[actual]
          true
        rescue
          false
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
