module Ecm
  module UserArea
    class UserPassword
      include ActiveModel::Model

      attr_accessor :email

      def save
        true
      end
    end
  end
end