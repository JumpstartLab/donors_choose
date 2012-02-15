require 'donors_choose/version'
require 'donors_choose/request'

module DonorsChoose
  extend self

  attr_writer :api_key
  def api_key
    @api_key || "DONORSCHOOSE"
  end

  def projects_near_me(latitude, longitude)
    Request.get(:centerLat => latitude, :centerLong => longitude)
  end

  def projects_by_zip(zipcode)
    Request.get(:zip => zipcode)
  end
end
