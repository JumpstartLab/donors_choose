require 'donors_choose/version'
require 'donors_choose/request'

module DonorsChoose
  class << self
    attr_accessor :api_key
  end
end
