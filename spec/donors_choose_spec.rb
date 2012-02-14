$:.unshift("lib")
require 'donors_choose'

describe DonorsChoose do
  it "is able to have an API key set" do
    key = "this isn't an API key"
    DonorsChoose.api_key = key
    DonorsChoose.api_key.should eql(key)
  end

  context "requesting data" do
    let(:test_title) { "A test project" }

    it "is able to find projects near me" do
      projects = [double]
      DonorsChoose::Request.should_receive(:get).
        with(:centerLat => "40.4405556", :centerLong => "-79.9961111").
        and_return(projects)

      results = DonorsChoose.projects_near_me("40.4405556", "-79.9961111")
      results.should eq(projects)
    end

    it "is able to find projects by zip code" do
      projects = [double]
      DonorsChoose::Request.should_receive(:get).
        with(:keyword => "15232").
        and_return(projects)

      results = DonorsChoose.projects_by_zip("15232")
      results.should eq(projects)
    end
  end
end
