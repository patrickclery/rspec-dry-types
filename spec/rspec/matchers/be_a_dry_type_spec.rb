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

  it 'overrides the default RSpec type matchers' do
    expect('a string').to be_a(:string)
    expect('a string').to be_an(:string)
    expect('a string').to be_a_kind_of(:string)
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
    expect(a_string).to be_of_type(:string)
    expect(a_integer).to be_an(:integer)
    expect(a_integer_string).to be_a_kind_of(:string, strict: false)
    expect(a_symbol_string).to be_of_type(:symbol)
  end

  it 'is backwards compat with be_a' do
    expect("I'm so icy").to be_of_type(String)
    expect(nil).to be_of_type(NilClass)
    expect(123).to be_an(Integer)
    expect({}).to be_an(Hash)
    expect(:symbol).to be_a(Symbol)
    expect({ goo: "wop" }).to be_an(Hash)
    expect([]).to be_an(Array)
    expect(123).to be_a_kind_of(String, strict: false)
    expect(:symbol).to be_of_type(String, strict: false)
  end
end
