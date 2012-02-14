$:.unshift("lib")
require 'donors_choose'

describe DonorsChoose do
  it "is able to have an API key set" do
    key = "this isn't an API key"
    DonorsChoose.api_key = key
    DonorsChoose.api_key.should eql(key)
  end

  it "is able to find projects near me" do
    request = double
    request.should_receive(:fetch).and_return('{"proposals":  [{"title": "A test project"}]}')

    DonorsChoose::Request.should_receive(:new).and_return(request)

    projects = DonorsChoose.projects_near_me("40.4405556", "-79.9961111")
    projects.first.title.should eql("A test project")
  end
end
