require 'rails_helper'

feature 'user area' do
  include Devise::SignInHelper

  describe 'user edit page access' do
    background do
      I18n.locale = :en
      visit '/en/users/edit'
    end # background

    context 'with correct authentication' do
      background do
        @user = FactoryGirl.create(:user)
        @user.confirm!
        fill_in 'user[email]',    with: @user.email
        fill_in 'user[password]', with: @user.password
        find(:xpath, '//input[@type="submit"]').click
      end # background

      it 'should redirect to the user edit page' do
        page.current_path.should eq('/en/users/edit')
      end
    end

    context 'with wrong authentication' do
      background do
        fill_in 'user[email]',    with: 'chuck@example.com'
        fill_in 'user[password]', with: 'password'
        find(:xpath, '//input[@type="submit"]').click
      end # background

      it 'should redirect to the sign in page' do
        page.current_path.should eq('/en/users/sign_in')
      end
    end
  end # describe 'home page access'

  describe 'logout' do
    background do
      I18n.locale = :en
      @user = FactoryGirl.create(:user)
      @user.confirm!
      sign_in_with(@user.email, @user.password)
      click_link('Sign out')
    end # background

    it 'should redirect to the home page' do
      page.current_path.should eq('/en')
    end
  end # describe 'logout'
end # feature
