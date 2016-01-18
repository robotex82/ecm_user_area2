module Ecm::UserArea
  class Sessions::BaseController < ApplicationController
    helper_method :sessions_path

    def new
      @session = initialize_session
    end

    def create
      @session = session_class.new(permitted_params)

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

    def self.session_class
      fail 'please define self.session_class in your controller.'
    end

    private

    def sessions_path
      send("#{session_class.name.demodulize.underscore.pluralize.tr('/', '_')}_path".to_sym)
    end

    def new_session_path
      send("new_#{session_class.demodulize.underscore.tr('/', '_')}_path".to_sym)
    end

    def after_sign_in_url
      main_app.root_path
    end

    def after_sign_out_url
      main_app.root_path
    end

    def current_session
      send("current_#{session_class.name.demodulize.underscore.tr('/', '_')}".to_sym)
    end

    def session_class
      self.class.session_class
    end

    def initialize_session
      session_class.new
    end

    def permitted_params
      # raise 'Undefined abstract method permitted_params'
      params.require(session_class.name.demodulize.underscore.tr('/', '_')).permit(:email, :password)
    end
  end
end
