require 'donors_choose/version'
require 'donors_choose/request'
require 'json'
require 'ostruct'

module DonorsChoose
  extend self
  attr_accessor :api_key

  def projects_near_me(latitude, longitude)
    request = Request.new(:centerLat => latitude, :centerLong => longitude)
    data = JSON.parse(request.fetch)["proposals"]

    data.collect {|datum| OpenStruct.new(datum)}
  end

  def projects_by_zip(zipcode)
    request = Request.new(:keyword => zipcode)
    data = JSON.parse(request.fetch)["proposals"]

    data.collect {|datum| OpenStruct.new(datum)}
  end
end
