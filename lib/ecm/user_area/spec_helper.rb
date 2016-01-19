module Ecm::UserArea
  module SpecHelper
    def sign_in(user)
      visit '/de/auth/user_sessions/new'

      within('#new_user_session') do
        fill_in 'user_session[email]', with: user.email
        fill_in 'user_session[password]', with: 'password'
        click_on submit(:user_session, :create)
      end
    end
  end
end
