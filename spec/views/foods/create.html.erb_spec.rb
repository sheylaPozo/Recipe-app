# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foods/create.html.erb', type: :feature do
  describe 'Food create form' do
    before :each do
      visit new_user_session_path
      User.create(name: 'john doe', email: 'johndoe@mail.com', password: '111111', role: 'admin',
                  password_confirmation: '111111', confirmed_at: Date.today)
      fill_in 'Email', with: 'johndoe@mail.com'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      visit foods_path
    end
    it 'I can create a food' do
      fill_in 'Name', with: 'ramen'
      select 'unit', from: 'Measurement unit'
      fill_in 'Unit price', with: '10'
      click_button 'Submit'
      expect(page).to have_content('food created succesfully')
    end
  end
end
