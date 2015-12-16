require 'rails_helper'

module Ecm::UserArea
  describe Role do
    it { should have_many :role_permissions }
    it { should have_many :permissions }
    it { should have_many :user_roles }
    it { should have_many :users }
    
    it { should validate_presence_of :enabled_from }
    it { should validate_presence_of :enabled_to }
    it { should validate_presence_of :identifier }
    it { should validate_uniqueness_of :identifier }

    it { should respond_to?(:enabled?) }

    describe 'class' do
      subject { Ecm::UserArea::Role }
      it { should respond_to?(:enabled) }
    end
  end
end