module Ecm::UserArea
  class Users::BaseController < Ecm::UserArea::Configuration.base_controller.constantize
    include Controller::ResourceConcern
    include Controller::ResourceInflectionsConcern
    include Controller::ResourceUrlsConcern
    include Controller::RestActionsConcern
    include Controller::RedirectBackConcern

    before_action :authenticate_user!, except: [:new, :create]

    def create
      @resource = resource_class.new(permitted_params)
      flash[:notice] = I18n.t('messages.confirmations.ecm_user_area.send_instructions') if @resource.save && !request.xhr?
      respond_with @resource, location: after_registration_url
    end

    def update
      @resource = load_resource
      # do not assign password/confirmation if they are empty
      @resource.attributes = permitted_params.delete_if { |_k, v| v.empty? }

      if @resource.save && (@resource.previous_changes.keys.map(&:to_sym) & [:email, :crypted_password]).any?
        current_session(:user).destroy
        redirect_to(new_user_session_path)
        return
      end
      respond_with @resource, location: edit_user_path
    end

    private

    def after_registration_url
      new_user_session_path
    end

    def load_resource
      send("current_#{resource_class.name.demodulize.underscore}".to_sym)
    end

    def permitted_params
      params.require(resource_class.name.demodulize.underscore.to_sym).permit(:email, :password, :password_confirmation)
    end
  end
end
