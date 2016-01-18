module Controller
  module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
      helper_method :current_user_session, :current_user, :user_signed_in?
    end

    private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = Ecm::UserArea::UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def user_signed_in?
      !current_user.nil?
    end
  end
end
