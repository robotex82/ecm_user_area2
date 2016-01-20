module Ecm::UserArea
  class Users::BaseController < ApplicationController
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
      @resource.update_attributes(permitted_params)
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
