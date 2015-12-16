require 'rails_helper'

module Ecm::UserArea
  RSpec.describe Permission, type: :model do
    it { should have_many :role_permissions }
    it { should have_many :roles }

    it { should validate_presence_of :identifier }
    it { should validate_uniqueness_of :identifier }
  end
end
