module Ecm
  module UserArea
    class CurrentUsersController < Users::BaseController
      def self.resource_class
        Ecm::UserArea::User
      end
    end
  end
end