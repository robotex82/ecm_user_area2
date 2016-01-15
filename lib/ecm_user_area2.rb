require 'authlogic'
require 'haml-rails'
require 'simple_form'

require 'ecm/user_area/engine'
require 'ecm/user_area/configuration'

module Ecm
  module UserArea
    extend Configuration

    def self.table_name_prefix
      'ecm_user_area_'
    end
  end
end
