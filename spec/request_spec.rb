$:.unshift("lib")
require 'donors_choose/request'

require 'vcr'
require 'webmock'
VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir = 'cassettes'
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
    request.fetch.should_not be_nil
  end
end
