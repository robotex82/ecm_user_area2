module Ecm::UserArea
  class UserRole < ActiveRecord::Base
    # associations
    belongs_to :user
    # belongs_to :enabled_user, foreign_key: 'user_id', class_name: 'User'
    belongs_to :role

    belongs_to :enabled_role, -> { enabled }, foreign_key: 'role_id', class_name: 'Ecm::UserArea::Role'
    has_many :enabled_role_permissions, through: :enabled_role, source: :user_roles, class_name: 'Ecm::UserArea::RolePermission'
    has_many :enabled_permissions, through: :enabled_role_permissions, class_name: 'Ecm::UserArea::Permission', source: :permission

    # validations
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: :role_id }
    validates :role, presence: true
  end
end
