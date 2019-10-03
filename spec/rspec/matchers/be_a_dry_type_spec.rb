require 'dry-types'
require 'rspec/expectations'
require 'rspec/matchers/be_a_dry_type'

RSpec.describe "check types using be_of_type" do
  include RSpec::Matchers::DryTypes

  it 'passes the test when the actual value is of the expected Dry::Type' do
    expect('a string').to be_of_type(Dry::Types['strict.string'])
    expect(123).to be_of_type(Dry::Types['strict.integer'])
    expect(0.123).to be_of_type(Dry::Types['strict.float'])
    expect("123").to be_of_type(Dry::Types['coercible.integer'])
    expect(nil).to be_of_type(Dry::Types['coercible.string'])
    expect(nil).to be_of_type(Dry::Types['nil'])
  end

  it 'overrides the default RSpec type matchers' do
    expect('a string').to be_a(Dry::Types['strict.string'])
    expect('a string').to be_an(Dry::Types['strict.string'])
    expect('a string').to be_a_kind_of(Dry::Types['strict.string'])
  end

  it 'fails when given a non-dry type as a parameter' do
    expect { expect('a string').to be_a(Object) }.to raise_error(ArgumentError)
  end

end

# From README.md
RSpec.describe "Woptober" do
  include RSpec::Matchers::DryTypes

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
