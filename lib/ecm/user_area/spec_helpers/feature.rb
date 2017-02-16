module Ecm::UserArea
  module SpecHelpers
    module Feature
      def sign_up(user_attributes)
        visit "/#{I18n.locale}/auth/user/new"

        within('#new_user') do
          fill_in 'user[email]',                 with: user_attributes[:email]
          fill_in 'user[password]',              with: user_attributes[:password]
          fill_in 'user[password_confirmation]', with: user_attributes[:password]

          click_on I18n.t('helpers.submit.user.create')
        end
      end

      def sign_in(user)
        visit "/#{I18n.locale}/auth/user_session/new"

        within('#new_user_session') do
          fill_in 'user_session[email]',    with: user.email
          fill_in 'user_session[password]', with: user.password

          click_on I18n.t('helpers.submit.user_session.create')
        end
        # puts page.body
        # expect(page.status_code).to eq(200)
        # expect(current_path).to     eq("/#{I18n.locale}/backend")
        # expect(page.body).to        have_text(I18n.t('messages.success.ecm_user_area.signed_in'))
      end
    end
  end
end