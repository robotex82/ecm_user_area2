Rails.application.routes.draw do
  localized do
    Ecm::UserArea::Routing.routes(self)

    get '/', to: 'home#index'
  end

  root to: redirect("/#{I18n.locale}")
end
