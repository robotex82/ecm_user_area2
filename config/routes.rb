Ecm::UserArea::Engine.routes.draw do
  resource :user, except: [:index, :destroy]
  resource :user_password, only: [:new, :create]

  resource :user_session, only: [:new, :create, :destroy]
end
