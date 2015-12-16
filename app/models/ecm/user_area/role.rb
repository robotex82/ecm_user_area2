require 'model/flag_from_time_range_concern'

module Ecm::UserArea
  class Role < ActiveRecord::Base
    include Model::FlagFromTimeRangeConcern

    DEFAULTS = {
      enabled_from: '01.01.1900 00:00:00',
      enabled_to: '31.12.9999 23:59:59'
    }

    # associations
    has_many :user_roles, class_name:  'Ecm::UserArea::UserRole'
    has_many :users, through: :user_roles

    has_many :role_permissions, class_name: 'Ecm::UserArea::RolePermission'
    has_many :permissions, class_name: 'Ecm::UserArea::Permission', through: :role_permissions

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
