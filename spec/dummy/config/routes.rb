Rails.application.routes.draw do
  # Temporary fix for https://github.com/enriclluelles/route_translator/issues/123
  mount Ecm::UserArea::Engine, at: '/auth'
  get '/', to: 'home#index'

  localized do
    mount Ecm::UserArea::Engine, at: '/auth'
    get '/', to: 'home#index'
  end

  root to: redirect("/#{I18n.locale}")
end
