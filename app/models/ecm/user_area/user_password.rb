module Ecm
  module UserArea
    class UserPassword
      include ActiveModel::Model

      attr_accessor :email, :user

      def self.i18n_scope
        :activerecord
      end

      def save
        # @user = Ecm::UserArea::User.where(email: self.email).first
        # return false unless @user
        # Ecm::UserArea::UserMailer.password_reset_email(@user).deliver_later
        true
      end
    end
  end
end