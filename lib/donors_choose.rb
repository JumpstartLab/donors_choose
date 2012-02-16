require 'donors_choose/version'
require 'donors_choose/request'
require 'donors_choose/project'

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
end
