module Ecm::UserArea
  class UserRole < ActiveRecord::Base
    # associations
    belongs_to :user
    belongs_to :role

    # validations
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: :role_id }
    validates :role, presence: true
  end
end
