module Ecm
  module UserArea
    class UserPasswordResetRequest
      include ActiveModel::Model
      extend ActiveModel::Callbacks
      include ActiveModel::Validations::Callbacks

      # define_model_callbacks :validation

      attr_accessor :user, :email, :host

      def self.i18n_scope
        :activerecord
      end

      validates :email, :user, :host, presence: true

      before_validation :load_user

      def save
        return unless valid?
        self.user.reset_perishable_token
        self.user.save
        Ecm::UserArea::UserMailer.password_reset_email(self.user, host).deliver_later
      end

      private

      def load_user
        self.user = Ecm::UserArea::User.where(email: self.email).first
      end
    end
  end
end