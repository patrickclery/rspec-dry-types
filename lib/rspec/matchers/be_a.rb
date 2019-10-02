module RSpec
  module Matchers

    define :be_a_dry_type do |expected|
      match do |actual|
        BeA(expected, actual)
      end
      description do
        "be a #{expected}"
      end
    end


    alias_method :be_a, :be_a_dry_type
    alias_method :be_an, :be_a
    alias_method :be_a_kind_of, :be_a

    alias_matcher :a_kind_of, :be_a
    alias_matcher :a_kind_of, :be_a_kind_of
    alias_matcher :a_kind_of, :be_an

    # @api private
    # Provides the implementation for `be_a_kind_of`.
    # Not intended to be instantiated directly.
    class BeA < RSpec::Matchers::BuiltIn::BaseMatcher
      private

      def match(expected, actual)
        unless expected.kind_of?(Dry::Types)
          super(expected, actual)
        end
        expected[actual]
      rescue NoMethodError
        raise ::ArgumentError, "The #{matcher_name} matcher requires that " \
                                 "the actual object responds to #kind_of? method " \
                                 "but a `NoMethodError` was encountered instead."
      end
    end
  end
end
