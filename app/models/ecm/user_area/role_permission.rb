module Ecm::UserArea
  class RolePermission < ActiveRecord::Base
    # associations
    belongs_to :permission
    belongs_to :role
    has_many :user_roles, through: :role
    has_many :users, through: :user_roles

    # belongs_to :enabled_permission, foreign_key: 'permission_id', class_name: 'Ecm::UserArea::Permission'

    belongs_to :enabled_role, -> { enabled }, foreign_key: 'role_id', class_name: 'Ecm::UserArea::Role'
    has_many :enabled_user_roles, through: :enabled_role, source: :user_roles
    has_many :enabled_users, through: :enabled_user_roles, source: :enabled_role_permissions

    # validations
    validates :permission, presence: true
    validates :permission_id, uniqueness: { scope: :role_id }
    validates :role, presence: true
  end
end
