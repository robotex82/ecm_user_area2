namespace :ecm do
  namespace :user_area do
    desc 'Creates the default user with email/password: user@example.com/password'
    task :create_default_user do
      Ecm::UserArea::CreateDefaultUserService.call
    end
  end
end
