Ecm::UserArea.configure do |config|
  config.disable_registrations = false

  # Set the base controller
  #
  # Default: config.base_controller = 'FrontendController'
  #
  config.base_controller = 'FrontendController'

  # Set the base mailer
  #
  # Default: config.base_controller = 'ApplicationMailer'
  #
  config.base_controller = 'ApplicationMailer'

  # Settings this to true forces the after_sign_in_url after sign in.
  # If set to false, redirect to previous location will happen if 
  # existent.
  # 
  # Default: config.force_after_sign_in_url = false
  #
  config.force_after_sign_in_url = false

  # This is the block, that will be passed to the acts_as_authentic call
  # in the user model.
  # 
  # Default: config.acts_as_authentic_options = ->(c) do
  #            config.crypto_provider = Authlogic::CryptoProviders::BCrypt
  #            config.login_field = :email
  #          end
  config.acts_as_authentic_options = ->(c) do
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.login_field     = :email
  end
end
