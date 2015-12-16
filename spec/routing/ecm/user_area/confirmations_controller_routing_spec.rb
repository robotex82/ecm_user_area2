require 'rails_helper'

module Ecm::UserArea
  describe ConfirmationsController do
    it 'routes to #sign_in' do
      get('/en/users/confirmation/new').should route_to('ecm/user_area/confirmations#new', locale: 'en')
    end
  end
end
