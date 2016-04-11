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
      mattr_accessor(:base_mailer) { 'ApplicationMailer' }
      mattr_accessor(:force_after_sign_in_url) { false }
      mattr_accessor(:acts_as_authentic_options) do
        ->(config) do
          config.crypto_provider = Authlogic::CryptoProviders::BCrypt
          config.login_field     = :email
        end
      end
      mattr_accessor(:application_name) { Rails.application.class.name.deconstantize }
      mattr_accessor(:email_from_address) { 'info@example.com' }
    end
  end
end
