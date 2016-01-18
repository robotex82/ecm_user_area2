module Ecm::UserArea
  class UsersController < Users::BaseController
    def self.resource_class
      User
    end
  end
end
