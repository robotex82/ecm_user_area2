require 'rails_helper'
require 'ecm/user_area/spec_helper'

feature 'User Area -> Registration' do
  include Ecm::UserArea::SpecHelper

  background do
    I18n.locale = :de
  end

  describe 'new registration' do
    context 'when not signed in' do
      background do
        @user_attributes = attributes_for(:ecm_user_area_user)
      end

      it 'should create a user' do
        expect{ sign_up(@user_attributes) }.to change{ Ecm::UserArea::User.count }.from(0).to(1)
      end

      it 'should redirect to root' do
        sign_up(@user_attributes)
        expect(page.current_path).to eq('/de/auth/user_session/new')
      end

      it 'should show a success message' do
        sign_up(@user_attributes)
        expect(page.body).to include(I18n.t('messages.confirmations.ecm_user_area.send_instructions'))
      end
    end
  end

  describe 'editing a registration' do
    context 'when signed in' do
      background do
        @user = Ecm::UserArea::CreateDefaultUserService.call.user
        sign_in(@user)
      end

      it 'should allow access' do
        visit '/de/auth/user/edit'
        page.current_path.should eq('/de/auth/user/edit')
      end

      context 'changing email' do
        background do
          visit '/de/auth/user/edit'
        end

        it do
          expect {
            fill_in 'user[email]', with: 'new@example.com'
            click_on submit(:user, :update)
          }.to change {
            @user.reload
            @user.email
          }.from(@user.email).to('new@example.com')
        end

        it 'should sign out' do
          fill_in 'user[email]', with: 'new@example.com'
          click_on submit(:user, :update)

          expect(page.current_path).to eq('/de/auth/user_session/new')
        end
      end
    end

    context 'when not signed in' do
      it 'should redirect to the sign in page' do
        visit '/de/auth/user/edit'
        page.current_path.should eq('/de/auth/user_session/new')
      end
    end
  end
end
