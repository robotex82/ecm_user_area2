require 'rails_helper'

module Ecm::UserArea
  RSpec.describe RolePermission, type: :model do
    it { should belong_to :permission }
    it { should belong_to :role }

    it { should validate_presence_of :permission }
    it { should validate_uniqueness_of(:permission_id).scoped_to(:role_id) }
    it { should validate_presence_of :role }
  end
end
