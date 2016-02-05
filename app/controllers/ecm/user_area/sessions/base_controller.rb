module Ecm::UserArea
  class Sessions::BaseController < Ecm::UserArea::Configuration.base_controller.constantize
    include Controller::ResourceConcern
    include Controller::ResourceInflectionsConcern
    include Controller::ResourceUrlsConcern
    include Controller::RestActionsConcern
    include Controller::RedirectBackConcern

    skip_before_action :authenticate_user!, only: [:new, :create]

    def new
      @session = initialize_resource
      respond_with @session
    end

    def create
      @session = resource_class.new(permitted_params)

      if @session.save
        flash[:notice] = I18n.t('messages.success.ecm_user_area.signed_in') unless request.xhr?
        redirect_back_or(after_sign_in_url)
        return
      else
        render action: :new
      end
    end

    def destroy
      current_session(resource_class.name.demodulize.underscore.to_sym).destroy
      flash[:notice] = I18n.t('messages.success.ecm_user_area.signed_out') unless request.xhr?
      redirect_to after_sign_out_url
    end

    def self.resource_class
      fail 'please define self.session_class in your controller.'
    end

    private

    def after_sign_in_url
      "/#{I18n.locale}"
    end

    def permitted_params
      params.require(resource_class.name.demodulize.underscore.tr('/', '_')).permit(:email, :password)
    end
  end
end
