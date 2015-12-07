module Ecm
  module UserArea
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "initializer.rb", "config/initializers/ecm_user_area.rb"
        end   
      end
    end
  end
end        
