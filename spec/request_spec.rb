$:.unshift("lib")
require 'donors_choose/request'

describe DonorsChoose::Request do
  it "is able to request data from the API" do
    DonorsChoose.api_key = "DONORSCHOOSE"

    request = DonorsChoose::Request.new({:state => "NC",
                                         :community => "1007:3"})
    request.fetch.should_not be_nil
  end
end
