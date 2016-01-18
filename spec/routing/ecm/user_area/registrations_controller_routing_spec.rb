require 'rails_helper'

module Ecm::UserArea
  describe RegistrationsController do
    it 'routes to #sign_up' do
      get('/en/users/sign_up').should route_to('ecm/user_area/registrations#new', locale: 'en')
    end
  end
end
