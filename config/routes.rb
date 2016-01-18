Ecm::UserArea::Engine.routes.draw do
  resources :users, only: [:new, :create] do
    get  :edit,   on: :collection
    get  :show,   on: :collection
    post :update, on: :collection
  end

  resources :user_sessions, only: [:new, :create] do
    delete :index, on: :collection, action: :destroy
  end
end
