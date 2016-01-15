module Ecm::UserArea
  class User < ActiveRecord::Base
    acts_as_authentic do |config|
      # config.session_class = Ecm::UserArea:UserSession
      config.login_field = :email
    end
  end
end
