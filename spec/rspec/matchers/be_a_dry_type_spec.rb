require 'rspec/expectations'
require 'rspec/matchers/be_of_type'

RSpec.describe "check types using be_of_type" do
  include RSpec::Matchers::DryTypes

  it 'can expect a dry-type (by symbol)' do
    expect('a string').to be_of_type(:string)
    expect(123).to be_of_type(:integer)
    expect(0.123).to be_of_type(:float)
    expect(nil).to be_of_type(:nil)
    expect({}).to be_of_type(:hash)
    expect([]).to be_of_type(:array)
    expect(true).to be_of_type(:bool)
    expect(false).to be_of_type(:bool)
    expect(Date.new(2001, 2, 3)).to be_of_type(:date)
    expect(Time.new(2001, 2, 3, 4, 5, 6)).to be_of_type(:time)
    expect(DateTime.new(2001, 2, 3, 4, 5, 6)).to be_of_type(:date_time)
    expect(:abc).to be_of_type(:symbol)
  end

  it 'can expect any type' do
    # Any type
    expect('a string').to be_of_type(:any)
    expect(123).to be_of_type(:any)
    expect(0.123).to be_of_type(:any)
    expect(nil).to be_of_type(:any)
    expect({}).to be_of_type(:any)
    expect([]).to be_of_type(:any)
    expect(true).to be_of_type(:any)
    expect(false).to be_of_type(:any)
    expect(Date.new(2001, 2, 3)).to be_of_type(:any)
    expect(Time.new(2001, 2, 3, 4, 5, 6)).to be_of_type(:any)
    expect(DateTime.new(2001, 2, 3, 4, 5, 6)).to be_of_type(:any)
    expect(:abc).to be_of_type(:any)
    expect(0.1).to be_of_type(:any)
  end

  it 'can expect a value to be coercible into a type' do
    # actual.to_s
    expect(nil).to be_of_type(:string, strict: false)
    expect(123).to be_of_type(:string, strict: false) # 123.to_s == "123"
    expect(123).to be_of_type("coercible.string")

    # actual.to_i
    expect("123").to be_of_type(:integer, strict: false)
    expect(0.123).not_to be_of_type(:integer)
    expect(0.123).to be_of_type(:integer, strict: false)
  end

  # Strings must reference the dry-types docs
  it 'can expect a dry-type (by string)' do
    expect('a string').to be_of_type('strict.string')
    expect("123").to be_of_type('coercible.integer')
    expect('a string').to be_of_type('strict.string')
    expect(123).to be_of_type('strict.integer')
    expect(0.123).to be_of_type('strict.float')
    expect(nil).to be_of_type('strict.nil')
    expect({}).to be_of_type('strict.hash')
    expect([]).to be_of_type('strict.array')
    expect(true).to be_of_type('strict.bool')
    expect(false).to be_of_type('strict.bool')
    expect(Date.new(2001, 2, 3)).to be_of_type('strict.date')
    expect(Time.new(2001, 2, 3, 4, 5, 6)).to be_of_type('strict.time')
    expect(DateTime.new(2001, 2, 3, 4, 5, 6)).to be_of_type('strict.date_time')
    expect(:abc).to be_of_type('strict.symbol')

    # with an optional flag
    expect(123).to be_of_type('integer', strict: true)
    expect("123").to be_of_type('integer', strict: false)
  end

  # Note: there is no 'object' type for `dry-types`
  it 'can expect class inheritance of a type' do
    # String/Integer inherit from Object
    expect(String).to be_of_type(Object)
    expect(123).to be_of_type(Object)
    expect('a string').to be_of_type(Object)
  end

end

