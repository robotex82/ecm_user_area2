module Ecm::UserArea
  class PasswordResetRequests::BaseController < Ecm::UserArea::Configuration.base_controller.constantize
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

    def create
      @resource = resource_class.new(permitted_params)
      @resource.host = request.host
      @resource.save
      respond_with @resource, location: after_create_location
    end

    def edit
      @resource = load_user_by_token
      unless @resource
        flash[:error] = t('.user_not_found')
        redirect_to new_user_session_path
        return
      end
      respond_with @resource
    end


    private

    def load_user_by_token
      User.find_using_perishable_token(params[:token])
    end


    def permitted_params
      params.require(resource_class.name.demodulize.underscore.to_sym).permit(:email)
    end
  end
end
