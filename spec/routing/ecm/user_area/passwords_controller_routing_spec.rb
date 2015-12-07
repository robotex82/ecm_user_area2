require 'rails_helper'

module Ecm::UserArea
  describe PasswordsController do
    it 'routes to #new' do
      get('/en/users/password/new').should route_to('ecm/user_area/passwords#new', locale: 'en')
    end
  end
end

