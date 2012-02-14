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
    let(:request) {
      double(:fetch => %Q/{"proposals":  [{"title": "#{test_title}"}]}/)
    }

    let(:make_request) {
      DonorsChoose::Request.should_receive(:new).with(@request_args).and_return(request)
    }

    it "is able to find projects near me" do
      @request_args = {:centerLat => "40.4405556", :centerLong => "-79.9961111"}
      make_request

      projects = DonorsChoose.projects_near_me("40.4405556", "-79.9961111")
      projects.first.title.should eql(test_title)
    end

    it "is able to find projects by zip code" do
      @request_args = {:keyword => "15232"}
      make_request

      projects = DonorsChoose.projects_by_zip("15232")
      projects.first.title.should eql("A test project")
    end
  end
end
