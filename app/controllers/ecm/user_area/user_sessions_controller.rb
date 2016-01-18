module Ecm::UserArea
  class UserSessionsController < Sessions::BaseController
    def self.session_class
      UserSession
    end
  end
end
