module Ecm
  module UserArea
    module SpecHelpers
      def ensure_redirected_to_sign_in
        expect(current_path).to eq(new_user_session_path)
      end

      def sign_in(user)
        visit new_user_session_path
        within('#new_user') do
          fill_in 'user[email]',    with: user.email
          fill_in 'user[password]', with: user.password

          find('[type=submit]').click
        end
      end
    end
  end
end
