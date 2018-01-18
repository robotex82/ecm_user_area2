require 'active_model_serializers'
require 'authlogic'
require 'haml-rails'
require 'rails-add_ons'
require 'resource_renderer'
require 'simple_form'
require 'ecm_core'

require 'ecm/user_area/engine'
require 'ecm/user_area/configuration'

module Ecm
  module UserArea
    extend Configuration

    def self.table_name_prefix
      'ecm_user_area_'
    end

    module CurrentUser
      extend ActiveSupport::Concern

      class_methods do
        def current_user_id
          RequestLocals.fetch(:current_user_id) { nil }
        end

        def current_user
          RequestLocals.fetch(:current_user) { nil }
        end
      end
    end

    include CurrentUser
  end
end
