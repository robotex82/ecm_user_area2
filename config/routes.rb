Ecm::UserArea::Engine.routes.draw do
  resource :user, except: [:index, :destroy]

  resources :user_sessions, only: [:new, :create] do
    delete :index, on: :collection, action: :destroy
  end
end
