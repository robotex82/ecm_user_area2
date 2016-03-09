require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module UserArea
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:disable_registrations) { false }
      mattr_accessor(:base_controller) { 'FrontendController' }
      mattr_accessor(:force_after_sign_in_url) { false }
    end
  end
end
