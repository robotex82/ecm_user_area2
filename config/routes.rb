Ecm::UserArea::Engine.routes.draw do
  resource :user, except: [:index, :destroy, :show]

  resource :user_session, only: [:new, :create, :destroy]
end
