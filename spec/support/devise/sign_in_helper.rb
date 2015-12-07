module Devise::SignInHelper
  def sign_in(user)
    post user_session_path, {
      :user => {
        :email    => user.email,
        :password => user.password
      }
    }
  end

  def sign_in_with(email, password)
    #visit '/en/users/sign_in'
    visit '/en'
    click_link('Sign in')
    fill_in 'user[email]',    :with => email
    fill_in 'user[password]', :with => password
    find(:xpath, '//input[@type="submit"]').click
  end
end

