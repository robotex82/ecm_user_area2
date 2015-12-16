require 'rails_helper'

describe User do
  it { should have_many :user_roles }
  it { should have_many :roles }
  it { should have_many :role_permissions }
  it { should have_many :permissions }
  it { should have_many :enabled_permissions }

  it { should respond_to :allowed_to? }
end
