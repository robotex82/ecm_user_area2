module Ecm::UserArea
  class UserSession < Session::Base    
    # authenticate_with Ecm::UserArea::User
    
    attr_accessor :email, :password

    # find_by_login_method :find_by_downcase_email
  end
end