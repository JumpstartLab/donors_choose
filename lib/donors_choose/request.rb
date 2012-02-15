require 'cgi'
require 'uri'
require 'net/http'
require 'json'
require 'ostruct'

# This class provides a wrapper around all of the external interaction
# we'll be doing. It's kinda important, given we're wrapping an API. ;)
class DonorsChoose::Request

  # This method is a convenient factory method, and is the easiest way
  # to make a single request and get the data back.
   def self.get(params)
    new(params).get
  end

  # This API operates through making GET requests to an endpoint. It takes
  # a few different parameters to control how the data is acquired. We'll
  # just take those so we can properly construct the request.
  def initialize(params)
    @params = params
  end

  # This method is the main business process of this class: get the data,
  # parse the JSON it returns, grab the proposal list, and then build a
  # list of objects with the data.
  def get
    data = JSON.parse(fetch)["proposals"]
    data.collect {|datum| OpenStruct.new(datum)}
  end

  # This method wraps Net::HTTP, basically. We build up our own parameter
  # list, construct our URI, and fetch it.
  def fetch
    base_uri = 'http://api.donorschoose.org/common/json_feed.html'
    uri_params = @params.collect do |key, value|
      "#{key}=#{CGI.escape(value.to_s)}"
    end
    uri_params = [uri_params, "APIKey=#{DonorsChoose.api_key}"].join("&")
    Net::HTTP.get(URI(base_uri + "?" + uri_params))
  end
end
