Rails.application.routes.draw do
  localized do
    mount Ecm::UserArea::Engine, at: '/auth'

    get '/', to: 'home#index'
  end

  root to: redirect("/#{I18n.locale}")
end
