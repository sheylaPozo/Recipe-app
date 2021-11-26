# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'the signin process' do
    before :each do
      visit new_user_session_path
      User.create(name: 'john doe', email: 'johndoe@mail.com', password: '111111', role: 'admin',
                  password_confirmation: '111111', confirmed_at: Date.today)
    end

    it 'try to signs me in with false data' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'shows the username and password inputs' do
      expect(page).to have_css('input[type="email"]')
      expect(page).to have_css('input[type="password"]')
    end

    it 'click the submit button without filling in the required informations throw error message' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'filling email and password fields with correct data redirects to the root page' do
      fill_in 'Email', with: 'johndoe@mail.com'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
