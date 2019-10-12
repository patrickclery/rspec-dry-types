[![CircleCI](https://circleci.com/gh/patrickclery/rspec-dry-types.svg?style=svg)](https://circleci.com/gh/patrickclery/rspec-dry-types)

> Speed up test-driven development with looser or stronger type-checking in your RSpec tests

The [rspec-dry-types](https://github.com/patrickclery/rspec-dry-types) gem is a drop-in replacement for RSpec's `be_a_kind_of()` that allows you to TIGHTEN or LOOSEN what object types you expect returned.

Powered by the [dry-types gem](https://dry-rb.org/gems/dry-types/1.2/built-in-types/), you can find a list of all the reference keys for supported types [dry-types documentation for "Built-in Types"](https://dry-rb.org/gems/dry-types/1.2/built-in-types/).

## USAGE:

```ruby
require 'dry-types'
require 'rspec/expectations'
require 'rspec/matchers/be_of_type'

RSpec.describe "check types using be_of_type" do
  include RSpec::Matchers::DryTypes

  it 'can use a symbol to expect a dry-type' do
    expect('a string').to be_of_type(:string)
    expect(123).to be_of_type(:integer)
    expect(0.123).to be_of_type(:float)
    expect("123").to be_of_type(:integer, strict: false)
    expect(nil).to be_of_type(:string, strict: false)
    expect(nil).to be_of_type(:nil)
  end

  # Strings must reference the dry-types docs
  it 'can use string to expect a dry-type' do
    expect('a string').to be_of_type('string')
    expect('a string').to be_of_type('strict.string')
    expect(123).to be_of_type('integer')
    expect(123).to be_of_type('strict.integer')
    expect(0.123).to be_of_type('float')
    expect(0.123).to be_of_type('coercible.integer')
    expect("123").to be_of_type('integer', strict: false)
    expect(nil).to be_of_type('string', strict: false)
    expect(nil).to be_of_type('nil')
  end

  # Strings must reference the dry-types docs
  it 'is backwards compat with be_a' do
    expect('a string').to be_a(String)
    expect('a string').to be_a_kind_of('strict.string')
    expect(123).to be_an(Integer)
    expect(123).to be_an('integer')
  end

  it 'can use a class to check if its a type' do
    # Check inheritance
    expect(String).to be_of_type(Object)
    expect('a string').to be_of_type(Object)
    expect(123).to be_of_type(Object)

    # Check coercion
    expect(123).to be_of_type(String, strict: false)
    expect(0.123).not_to be_of_type(Integer)
    expect(0.123).to be_of_type(Integer, strict: false)
  end

end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-dry-types. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Rspec::Dry::Types project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec-dry-types/blob/master/CODE_OF_CONDUCT.md).
