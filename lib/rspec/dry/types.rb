require "rspec/dry/types/version"

module Rspec
  module Dry
    module Types

      def be_a_kind_of(expected)
        BuiltIn::BeAKindOf.new(expected)
      end
      class Error < StandardError; end
      # Your code goes here...
    end
  end
end
