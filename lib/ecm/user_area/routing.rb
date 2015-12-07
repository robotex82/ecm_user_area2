module Ecm
  module UserArea
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge!({})

        router.devise_for :users, :controllers => {
          :confirmations => 'ecm/user_area/confirmations',
          :passwords => 'ecm/user_area/passwords',
          :registrations => 'ecm/user_area/registrations',
          :sessions => 'ecm/user_area/sessions',
          :unlocks => 'ecm/user_area/unlocks'
        }
      end
    end
  end
end

