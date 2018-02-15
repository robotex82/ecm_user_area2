module Ecm
  module UserArea
    module PasswordResets
      class BaseController < Ecm::UserArea::Configuration.base_controller.constantize
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

      before_action :find_using_perishable_token

      private

      def load_resource
        @resource
      end

      def load_resource
        User.find_using_perishable_token(params[:token])
      end

      def permitted_params
        params.require(:user).permit(:password, :password_confirmation)
      end

      def after_update_location
        new_user_session_path
      end

      def handle_user_not_found
        redirect_to new_user_session_path, notice: t("messages.failures.ecm_user_area.perishable_token_invalid")
      end
      
      def find_using_perishable_token
        @resource =  User.find_using_perishable_token(params[:token])
        handle_user_not_found if @resource.nil?
      end
    end
  end
end
