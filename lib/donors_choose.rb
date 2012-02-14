require 'donors_choose/version'
require 'donors_choose/request'

module DonorsChoose
  extend self
  attr_accessor :api_key

  def projects_near_me(latitude, longitude)
    Request.get(:centerLat => latitude, :centerLong => longitude)
  end

  def projects_by_zip(zipcode)
    Request.get(:keyword => zipcode)
  end
end
