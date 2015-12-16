FactoryGirl.define do
  factory :ecm_user_area_user_role, class: 'Ecm::UserArea::UserRole' do
    association :user
    association :role, factory: :ecm_user_area_role
  end
end
