module Ecm::UserArea
  module SpecHelper
    def sign_up(user_attributes)
      visit '/de/auth/user/new'

      within('#new_user') do 
        fill_in 'user[email]',                 with: user_attributes[:email]
        fill_in 'user[password]',              with: user_attributes[:password]
        fill_in 'user[password_confirmation]', with: user_attributes[:password]
        click_on submit(:user, :create)
      end
    end

    def sign_in(user)
      visit '/de/auth/user_session/new'

      within('#new_user_session') do 
        fill_in 'user_session[email]', with: user.email
        fill_in 'user_session[password]', with: 'password'
        click_on submit(:user_session, :create)
      end
    end
  end
end
