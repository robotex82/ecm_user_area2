Ecm::UserArea::Engine.routes.draw do
  localized do
    scope :ecm_user_area do
      resource :user, only: [:show, :edit, :update]
      resource :user, only: [:new, :create] if Ecm::UserArea::Configuration.enable_registrations
      resource :user, only: [:destroy] if Ecm::UserArea::Configuration.allow_users_to_destroy_self
      resource :user_password_reset_request, only: [:new, :create]

      resource :user_password_reset, only: [] do
        get 'edit/:token' => 'user_password_resets#edit', constraint: { token: /\d+/ }, as: :edit
        match '/:id/:token' => 'user_password_resets#update', constraint: { token: /\d+/ }, as: :update, via: [:put, :patch]
      end

      resource :user_session, only: [:new, :create, :destroy]

      root to: 'user#show'
    end
  end
end
