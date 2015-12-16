FactoryGirl.define do
  factory :ecm_user_area_permission, class: 'Ecm::UserArea::Permission' do
    sequence     :identifier
    enabled_from '01.01.1900'
    enabled_to   '31.12.9999'
  end
end
