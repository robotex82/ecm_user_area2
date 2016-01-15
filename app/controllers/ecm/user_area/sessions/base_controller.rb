module Ecm::UserArea
  class Sessions::BaseController < ApplicationController
    helper_method :sessions_path

    def new
      @session = initialize_session
    end

    def create
      @session = session_class.new(permitted_params)
      # raise permitted_params.inspect
      # raise @session.inspect
      if @session.save
        redirect_to after_sign_in_url
      else
        render action: :new
      end
    end

    def destroy
      current_session.destroy
      redirect_to new_session_path
    end

    def self.session_class
      UserSession
    end

    private

    def sessions_path
      send("#{session_class.name.demodulize.underscore.pluralize.gsub('/', '_')}_path".to_sym)
    end

    def new_session_path
      send("new_#{session_class.demodulize.underscore.gsub('/', '_')}_path".to_sym)
    end

    def after_sign_in_url
      main_app.root_path
    end

    def current_session
      send("current_#{session_class.demodulize.underscore.gsub('/', '_')}".to_sym)
    end

    def session_class
      self.class.session_class
    end

    def initialize_session
      session_class.new
    end

    def permitted_params
      # raise 'Undefined abstract method permitted_params'
      params.require(session_class.name.demodulize.underscore.gsub('/', '_')).permit(:email, :password)
    end
  end
end