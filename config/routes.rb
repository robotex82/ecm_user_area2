Ecm::UserArea::Engine.routes.draw do
  resources :user_sessions, only: [:new, :index]
end
