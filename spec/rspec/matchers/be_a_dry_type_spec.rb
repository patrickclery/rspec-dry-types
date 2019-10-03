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
