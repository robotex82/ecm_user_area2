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
  end
end
