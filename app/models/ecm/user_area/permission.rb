module Ecm::UserArea
  class Permission < ActiveRecord::Base
    include Model::FlagFromTimeRangeConcern

    DEFAULTS = {
      enabled_from: '01.01.1900 00:00:00',
      enabled_to: '31.12.9999 23:59:59'
    }

    # associations
    has_many :role_permissions, class_name: 'Ecm::UserArea::RolePermission'
    has_many :roles, class_name: 'Ecm::UserArea::Role', through: :role_permissions
    has_many :enabled_roles, -> { enabled }, class_name: 'Ecm::UserArea::Role', through: :role_permissions, source: :permission

    flag_from_time_range :enabled?

    # validations
    validates :identifier, presence: true, uniqueness: true
    validates :enabled_from, presence: true
    validates :enabled_to, presence: true

    # callbacks
    after_initialize :set_defaults

    private

    def set_defaults
      return if persisted?
      self.enabled_from = DEFAULTS[:enabled_from]
      self.enabled_to = DEFAULTS[:enabled_to]
    end
  end
end
