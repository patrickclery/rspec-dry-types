[![CircleCI](https://circleci.com/gh/patrickclery/rspec-dry-types.svg?style=svg)](https://circleci.com/gh/patrickclery/rspec-dry-types)

# `dry-types` for RSpec

`rspec-dry-types` replace RSpec's default type checkers with a more robust set of type-checking tools powered by the [dry-types gem](http://dry-rb.org/gems/dry-types/). 

Normally, something like this doesn't work:
 
```ruby
expect("123").to be_a(Integer) # FAILS
```

`rspec-dry-types` allow you to tighten or loosen type-constraints in RSpec:

```ruby
expect("123").to be_a(Integer, strict: false) # PASSES
expect("123").to be_a(Float, strict: false) # PASSES
expect("123").to be_a('coercible.integer') # PASSES - using references from the dry-types docs
```

```ruby
expect("123").not_to be_a('strict.integer') # PASSES - It's not an INTEGER, it's a STRING
expect("123").to be_a('coercible.integer') # PASSES - The test coerces the value to an integer BEFORE testing => "123" becomes 123
```
 
## Usage:

```ruby
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

    # Check coercion
    expect(123).to be_of_type(String, strict: false)
    expect(0.123).not_to be_of_type(Integer)
    expect(0.123).to be_of_type(Integer, strict: false)

    expect(123).to be_of_type(Object)
    expect(123).to be_of_type(Object)
  end

end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-dry-types. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Rspec::Dry::Types project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec-dry-types/blob/master/CODE_OF_CONDUCT.md).
