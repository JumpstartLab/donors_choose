require 'donors_choose/core_ext/object'

# simple implementation of the readonly OpenStruct class
module DonorsChoose
  module Utils
    class StaticStruct
      def initialize(params={})
        singleton_class.module_eval do
          params.each do |key, value|
            define_method key do
              value
            end
          end
        end
      end
    end
  end
end
