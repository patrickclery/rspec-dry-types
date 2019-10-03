require 'dry/types'
require 'rspec/expectations'

module RSpec::Matchers
  module DryTypes
    extend RSpec::Matchers::DSL

    matcher :be_of_type do |expected|
      match do |actual|
        unless expected.kind_of?(Dry::Types::Type)
          raise ::ArgumentError, "The `be_of_type` matcher requires that " \
                                   "the actual object responds to #kind_of? method " \
                                   "but a `NoMethodError` was encountered instead."
        end
        begin
          expected[actual]
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
