module Ecm::UserArea
  class UserSessionsController < Sessions::BaseController
    def self.resource_class
      UserSession
    end
  end
end
