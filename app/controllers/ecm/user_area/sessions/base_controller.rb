module Ecm::UserArea
  class Sessions::BaseController < ApplicationController
    include Controller::ResourceConcern
    include Controller::ResourceInflectionsConcern
    include Controller::ResourceUrlsConcern
    include Controller::RestActionsConcern

    def new
      @session = initialize_resource
      respond_with @session
    end

    def create
      @session = resource_class.new(permitted_params)

      if @session.save
        redirect_to after_sign_in_url
      else
        render action: :new
      end
    end

    def destroy
      current_session.destroy
      redirect_to after_sign_out_url
    end

    def self.resource_class
      fail 'please define self.session_class in your controller.'
    end

    private

    def after_sign_in_url
      main_app.root_path(locale: I18n.locale)
      "/#{I18n.locale}"
    end

    def after_sign_out_url
      main_app.root_path(locale: I18n.locale)
      "/#{I18n.locale}"
    end

    def current_session
      send("current_#{resource_class.name.demodulize.underscore.tr('/', '_')}".to_sym)
    end

    def permitted_params
      params.require(resource_class.name.demodulize.underscore.tr('/', '_')).permit(:email, :password)
    end
  end
end
