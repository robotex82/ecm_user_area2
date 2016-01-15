require_dependency 'itsf_services'
require_dependency 'active_model/validations/file_readability_validator'

module Ecm::UserArea
  class ImportDefaultPermissionsService < Itsf::Services::V2::Service::Base
    class Response < Itsf::Services::V2::Response::Base
      attr_accessor :permissions, :roles, :role_permissions
    end

    attr_accessor :filename

    validates :filename, file_readability: true

    def do_work
      say 'Start'
      say 'Validating input', indent: 1
      unless valid?
        say "Inputs are invalid. Errors: #{errors.full_messages.to_sentence}", indent: 1
        say 'Aborted'
        return response 
      end
      say 'Input is valid', indent: 1

      load_yaml
      return response unless yaml_structure_valid?

      load_permissions
      load_roles

      response.permissions = create_or_update_permissions
      response.roles = create_or_update_roles
      response.role_permissions = create_or_update_role_permissions
      say 'Done'
      respond
    end

    private

    def create_or_update_permissions
      permissions = @permissions.collect do |permission_identifier|
        Ecm::UserArea::Permission.where(identifier: permission_identifier).first_or_initialize.tap do |permission|
          permission.save!
        end
      end
      say "Saved #{permissions.count} permissions", indent: 1
      permissions
    end

    def create_or_update_roles
      roles = @roles.collect do |role_identifier, permissions|
        Ecm::UserArea::Role.where(identifier: role_identifier).first_or_initialize.tap do |role|
          role.save!
        end
      end
      say "Saved #{roles.count} roles", indent: 1
      roles
    end

    def create_or_update_role_permissions
      role_permissions = @roles.collect do |role_identifier, permissions|
        role = Ecm::UserArea::Role.where(identifier: role_identifier).first
        permissions.collect do |permission_identifier|
          permission = Ecm::UserArea::Permission.where(identifier: permission_identifier).first

          Ecm::UserArea::RolePermission.where(role_id: role, permission_id: permission).first_or_initialize.tap do |role_permission|
            role_permission.save!
          end
        end
      end.flatten
      say "Saved #{role_permissions.count} role permissions", indent: 1
      role_permissions
    end

    def load_permissions
      @permissions = @yaml[:defaults][:permissions]
      say "Loaded #{@permissions.size} permissions", indent: 1
    end

    def load_roles
      @roles = @yaml[:defaults][:roles]
      say "Loaded #{@roles.size} roles", indent: 1
    end

    def load_yaml
      @yaml = YAML.load_file(filename).with_indifferent_access
      say "Loaded YAML from #{filename}", indent: 1
    end

    def yaml_structure_valid?
      say "Checking for valid YAML structure", indent: 1
      unless @yaml.is_a?(Hash)
        add_error_and_say(:yaml_file, "Expected file content of #{filename} to parse to a Hash, but was #{@yaml.class}")
        return false
      end

      unless @yaml.has_key?(:defaults)
        add_error_and_say(:yaml_file, "Expected yaml in #{filename} to have the key [defaults:].")
        return false
      end

      unless @yaml[:defaults].has_key?(:roles)
        add_error_and_say(:yaml_file, "Expected yaml in #{filename} to have the key [defaults:][roles:].")
        return false
      end


      unless @yaml[:defaults].has_key?(:permissions)
        add_error_and_say(:yaml_file, "Expected yaml in #{filename} to have the key [defaults:][permissions:].")
        return false
      end

      return true
    end
  end
end