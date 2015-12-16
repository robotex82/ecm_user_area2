FactoryGirl.define do
  factory :ecm_user_area_role_permission, class: 'Ecm::UserArea::RolePermission' do
    association :role,       factory: :ecm_user_area_role
    association :permission, factory: :ecm_user_area_permission
  end
end
