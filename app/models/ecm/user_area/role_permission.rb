module Ecm::UserArea
  class RolePermission < ActiveRecord::Base
    # associations
    belongs_to :permission
    belongs_to :role

    # validations
    validates :permission, presence: true
    validates :permission_id, uniqueness: { scope: :role_id }
    validates :role, presence: true
  end
end
