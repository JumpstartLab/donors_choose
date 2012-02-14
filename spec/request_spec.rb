$:.unshift("lib")
require 'donors_choose/request'

describe DonorsChoose::Request do
  it "is able to request data from the API" do
    request = DonorsChoose::Request.new({:state => "NC",
                                         :community => "1007:3",
                                         :APIKey => "DONORSCHOOSE"})
    request.fetch.should_not be_nil
  end
end
