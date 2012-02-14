require 'lib/donors_choose'

describe DonorsChoose do
  it "is able to have an API key set" do
    key = "this isn't an API key"
    DonorsChoose.api_key = key
    DonorsChoose.api_key.should eql(key)
  end

  pending do
  it "is able to find projects near me" do
    lat = 40.4405556
    long = -79.9961111
    projects = DonorsChoose.projects_near_me(lat, long)
    projects.title.should eql("A test project")
  end
  end
end
