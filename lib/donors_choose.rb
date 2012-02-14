require 'donors_choose/version'
require 'donors_choose/request'
require 'json'

module DonorsChoose
  extend self
  attr_accessor :api_key

  Data = Struct.new(:title)

  def projects_near_me(latitude, longitude)
    request = Request.new(:centerLat => latitude, :centerLong => longitude)
    data = JSON.parse(request.fetch)["proposals"]

    data.collect{|datum| Data.new(datum["title"])}
  end
end
