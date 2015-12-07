require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module UserArea
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :disable_registrations
      @@disable_registrations = false

      def self.registrations_disabled?
        !!@@disable_registrations
      end
    end
  end
end
