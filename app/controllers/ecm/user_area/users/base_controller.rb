module Ecm::UserArea
  class Users::BaseController < ApplicationController
    include Controller::ResourceConcern
    include Controller::ResourceInflectionsConcern
    include Controller::ResourceUrlsConcern
    include Controller::RestActionsConcern

    def create
      @resource = resource_class.new(permitted_params)
      @resource.save
      respond_with @resource, location: after_registration_url
    end

    private

    def after_registration_url
      main_app.root_path
    end

    def load_resource
      send("current_#{resource_class.name.demodulize.underscore}".to_sym)
    end

    def permitted_params
      params.require(resource_class.name.demodulize.underscore.to_sym).permit(:email, :password, :password_confirmation)
    end
  end
end
