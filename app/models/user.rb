class User < ActiveRecord::Base
  module Rbac
    extend ActiveSupport::Concern

    included do
      has_many :user_roles, class_name: 'Ecm::UserArea::UserRole'
      has_many :roles, class_name: 'Ecm::UserArea::Role', through: :user_roles

      has_many :enabled_roles, -> { enabled }, class_name: 'Ecm::UserArea::Role', through: :user_roles, source: :user
      # has_many :user_roles, class_name: 'Ecm::UserArea::UserRole'
      # has_many :roles, class_name: 'Ecm::UserArea::Role', through: :user_roles
      # has_many :role_permissions, class_name: 'Ecm::UserArea::Permission', through: :user_roles
      # has_many :permissions, class_name: 'Ecm::UserArea::Permission', through: :role_permissions

      # # has_many :enabled_roles, -> { enabled }, class_name: 'Ecm::UserArea::Role', through: :user_roles # , source: :user
      # # has_many :enabled_permissions, -> { enabled }, class_name: 'Ecm::UserArea::Permission', through: :role_permissions # , source: :users
      
      # has_many :enabled_user_roles, class_name: 'Ecm::UserArea::UserRole'
      # has_many :enabled_roles, -> { enabled }, class_name: 'Ecm::UserArea::Role', through: :enabled_user_roles, source: :role
      # has_many :enabled_role_permissions, class_name: 'Ecm::UserArea::Permission', through: :enabled_user_roles
      # has_many :enabled_permissions, -> { enabled }, class_name: 'Ecm::UserArea::Permission', through: :enabled_role_permissions # , source: :roles
    end

    def allowed_to?(permission_name)
      enabled_permissions.map(&:identifier).map(&:to_sym).include?(permission_name.to_sym)
    end
  end

  include Rbac

  devise(:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable) && :omniauthable

  scope :never_signed_in, -> { where(sign_in_count: 0) }

  def devise_mailer
    Ecm::UserArea::Mailer
  end
end
