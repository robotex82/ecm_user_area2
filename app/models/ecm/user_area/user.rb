require 'bcrypt'

module Ecm::UserArea
  class User < ActiveRecord::Base
    acts_as_authentic do |config|
      # config.session_class = Ecm::UserArea:UserSession
      # c.crypto_provider = Authlogic::CryptoProviders::BCrypt
      config.crypto_provider = Authlogic::CryptoProviders::BCrypt
      config.login_field = :email

      # def self.find_by_downcase_email(email)
      #   find_by_email(email.downcase)
      # end
    end

    scope :for_autocomplete, ->(matcher) { where("LOWER(email) LIKE ?", "%#{matcher.downcase}%") }

    def as_json(options = {})
      options.reverse_merge!(style: :default)

      style = options.delete(:style)

      case style
      when :autocomplete
        { value: id, title: human, subtitle: self.inspect }
      else
        super
      end
    end

    def human
      email
    end
  end
end
