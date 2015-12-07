require 'rails_helper'

module Ecm::UserArea
  describe UnlocksController do
    it 'routes to #sign_in' do
      get('/en/users/unlock/new').should route_to('ecm/user_area/unlocks#new', locale: 'en')
    end
  end
end

