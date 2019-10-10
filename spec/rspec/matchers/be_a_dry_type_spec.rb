require 'dry-types'
require 'rspec/expectations'
require 'rspec/matchers/be_a_dry_type'

RSpec.describe "check types using be_of_type" do
  include RSpec::Matchers::DryTypes

  it 'passes the test when the actual value is of the expected Dry::Type' do
    expect('a string').to be_of_type(:string)
    expect(123).to be_of_type(:integer)
    expect(0.123).to be_of_type(:float)
    expect("123").to be_of_type(:integer, strict: false)
    expect(nil).to be_of_type(:string, strict: false)
    expect(nil).to be_of_type(:nil)
  end

  it 'support dry-types string references' do
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

  it 'overrides the default RSpec type matchers' do
    expect('a string').to be_a(:string)
    expect('a string').to be_an(:string)
    expect('a string').to be_a_kind_of(:string)
  end

  it 'succeeds when given a non-dry type as a parameter' do
    expect('a string').to be_of_type(Object)
    expect(123).to be_of_type(String, strict: false)
  end

end

