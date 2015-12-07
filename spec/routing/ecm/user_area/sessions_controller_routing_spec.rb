require 'rails_helper'

module Ecm::UserArea
  describe SessionsController do
    it 'routes to #sign_in' do
      get('/en/users/sign_in').should route_to('ecm/user_area/sessions#new', locale: 'en')
    end
  end
end

