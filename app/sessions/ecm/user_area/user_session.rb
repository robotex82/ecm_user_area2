module Ecm::UserArea
  class UserSession < Session::Base
    # authenticate_with Ecm::UserArea::User

    # attr_accessor :email, :password

    # find_by_login_method :find_by_downcase_email

    params_key "#{self.name.demodulize.tableize.gsub('_sessions', '')}_api_key"
    single_access_allowed_request_types = :json
    generalize_credentials_error_messages true
  end
end
