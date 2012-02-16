require 'donors_choose'

describe DonorsChoose do
  it "is able to have an API key set" do
    key = "this isn't an API key"
    described_class.api_key = key
    described_class.api_key.should eq(key)
  end
end
