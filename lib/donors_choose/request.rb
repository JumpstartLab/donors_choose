require 'cgi'
require 'uri'
require 'net/http'
require 'json'
require 'ostruct'

class DonorsChoose::Request
   def self.get(params)
    new(params).get
  end

  def initialize(params)
    @params = params
  end

  def get
    data = JSON.parse(fetch)["proposals"]
    data.collect {|datum| OpenStruct.new(datum)}
  end

  def fetch
    base_uri = 'http://api.donorschoose.org/common/json_feed.html'
    uri_params = @params.collect do |key, value|
      "#{key}=#{CGI.escape(value.to_s)}"
    end
    uri_params = [uri_params, "APIKey=#{DonorsChoose.api_key}"].join("&")
    Net::HTTP.get(URI(base_uri + "?" + uri_params))
  end
end
