$:.unshift("lib")
require 'donors_choose/request'

require 'vcr'
require 'webmock'
YAML_SERIALIZATION_VERSION = RUBY_VERSION =~ /1\.8/ ? '1.8' : 'not_1.8'
VCR.config do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__), '..', 'cassettes', YAML_SERIALIZATION_VERSION)
  c.stub_with :webmock
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end

describe DonorsChoose::Request do
  use_vcr_cassette

  it "is able to request data from the API" do
    DonorsChoose.api_key = "DONORSCHOOSE"

    request = DonorsChoose::Request.new({:state => "NC",
                                         :community => "1007:3"})
    request.process.should_not be_nil
  end
end
