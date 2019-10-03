# Dry::Types for RSpec

`rspec-dry-types` makes type-checking in Test-Driven Development easier by replacing RSpec's default type checkers with ones that check values using the [dry-types gem](http://dry-rb.org/gems/dry-types/). 
 
 This:
 
 ```ruby
expect(subject).to be_a(String)
```

Becomes this:

```ruby
expect(subject).to be_a(Dry::Types['strict.string'])
```
 
## Usage:


```ruby
require 'rspec-dry-types'
RSpec.describe "Woptober" do
  include RSpec::Matchers::DryType

  let(:a_string) { "Gucci Mane" }
  let(:a_integer) { 1017 }
  let(:a_integer_string) { "1017" }
  let(:a_symbol_string) { :la_flare }

  it 'validates the types' do
    expect(a_string).to be_a(Dry::Types['strict.string'])
    expect(a_integer).to be_an(Dry::Types['strict.integer'])
    expect(a_integer_string).to be_a_kind_of(Dry::Types['coercible.string'])
    expect(a_symbol_string).to be_of_type(Dry::Types['coercible.string'])
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-dry-types. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Rspec::Dry::Types project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rspec-dry-types/blob/master/CODE_OF_CONDUCT.md).
