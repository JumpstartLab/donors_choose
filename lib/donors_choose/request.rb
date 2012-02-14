require 'cgi'
require 'uri'
require 'net/http'

class DonorsChoose::Request
  def initialize(params)
    @params = params
  end

  def fetch
    base_uri = 'http://api.donorschoose.org/common/json_feed.html'
    uri_params = @params.collect do |key, value|
      "#{key}=#{CGI.escape(value.to_s)}"
    end.join("&")
    Net::HTTP.get(URI(base_uri + "?" + uri_params))
  end
end
