module Ecm::UserArea
  class PasswordResets::BaseController < Ecm::UserArea::Configuration.base_controller.constantize
    include Controller::ResourceConcern
    include Controller::ResourceInflectionsConcern
    include Controller::ResourceUrlsConcern
    include Controller::RestActionsConcern
    include Controller::RedirectBackConcern
    
    if Rails.version < '5'
      skip_before_action :authenticate_user!
    else
      skip_before_action :authenticate_user!, raise: false
    end

    private

    def load_resource
      User.find_using_perishable_token(params[:token])
    end

    def permitted_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def after_update_location
      new_user_session_path
    end
  end
end
