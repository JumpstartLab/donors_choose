require 'donors_choose/version'
require 'donors_choose/request'

# This module provides the entry point for the library. Everything here
# is considered public, the rest of the objects are essentially internal.
module DonorsChoose
  # An API key is needed to make requests. Get one
  # [here](http://developer.donorschoose.org/help-contact).
  def self.api_key=(key)
    @api_key = key
  end

  # We default to the development key that works for everyone. Set it to
  # something else in production environments.
  def self.api_key
    @api_key || "DONORSCHOOSE"
  end

  # This method finds all projects near a given latitude and longitude.
  def self.projects_near_me(latitude, longitude)
    Request.get(:centerLat => latitude, :centerLong => longitude)
  end

  # This method allows you to look up all projects by a zip code.
  def self.projects_by_zip(zipcode)
    Request.get(:zip => zipcode)
  end
end
