module Ecm::UserArea
  class Passwords::BaseController < Ecm::UserArea::Configuration.base_controller.constantize
    include Controller::ResourceConcern
    include Controller::ResourceInflectionsConcern
    include Controller::ResourceUrlsConcern
    include Controller::RestActionsConcern
    include Controller::RedirectBackConcern
    
    skip_before_action :authenticate_user!

    private

    def permitted_params
      params.require(resource_class.name.demodulize.underscore.to_sym).permit(:email)
    end
  end
end
