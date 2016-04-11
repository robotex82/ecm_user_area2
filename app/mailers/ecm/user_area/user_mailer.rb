module Ecm::UserArea
  class UserMailer < Ecm::UserArea::Configuration.base_mailer.constantize
    def password_reset_email(user)
      @user = user
      mail(to: @user.email)
    end
  end
end