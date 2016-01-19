module Controller
  module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
      helper_method :current_user_session, :current_user, :user_signed_in?
    end

    private

    def authenticate_user!
      unless user_signed_in?
        store_location
        redirect_to(user_authentication_failed_path, notice: t('messages.failures.ecm_user_area.authentication_failed'))
        return false 
      end
      true
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = Ecm::UserArea::UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def user_authentication_failed_path
      ecm_user_area.new_user_session_path
    end

    def user_signed_in?
      !current_user.nil?
    end
  end
end
