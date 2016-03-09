Ecm::UserArea.configure do |config|
  config.disable_registrations = false

  # Set the base controller
  #
  # Default: config.base_controller = 'FrontendController'
  #
  config.base_controller = 'FrontendController'

  # Settings this to true forces the after_sign_in_url after sign in.
  # If set to false, redirect to previous location will happen if 
  # existent.
  # 
  # Default: config.force_after_sign_in_url = false
  #
  config.force_after_sign_in_url = true
end
