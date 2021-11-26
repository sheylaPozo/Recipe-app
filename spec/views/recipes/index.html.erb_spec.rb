# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  describe 'recipes index page' do
    before :each do
      visit new_user_session_path
      john = User.create(name: 'john doe', email: 'johndoe@mail.com', password: '111111', role: 'admin',
                  password_confirmation: '111111', confirmed_at: Date.today)
      fill_in 'Email', with: 'johndoe@mail.com'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      
      test_recipe = Recipe.new
      test_recipe.user_id = john.id
      test_recipe.name = 'test food',
      test_recipe.description = 'this is a test description',
      test_recipe.cooking_time = 30,
      test_recipe.preparation_time = 50,
      test_recipe.is_public = true
      test_recipe.save
      visit recipes_my_recipes_path

    end

    it 'I can see the my recipe header' do
      expect(page).to have_content('My Recipes')
    end

    it 'I can see the recipe i created' do
      expect(page).to have_content('test food')
      expect(page).to have_content('this is a test description')
    end
  end
end
