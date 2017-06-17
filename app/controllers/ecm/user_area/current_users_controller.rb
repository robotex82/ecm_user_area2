module Ecm::UserArea
  class CurrentUsersController < Users::BaseController
    def self.resource_class
      User
    end
  end
end
