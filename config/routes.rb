# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  get '/recipes/my_recipes', to: 'recipes#my_recipes'
  get '/recipes/create_recipe', to: 'recipes#new_recipe'
  get '/recipes/:recipe_id', to: 'recipes#show'
  post '/recipes/create', to: 'recipes#create'
  get '/recipes/:recipe_id', to: 'recipes#show'
  post '/recipes/destroy', to: 'recipes#destroy'
  get '/foods', to: 'foods#index'
  post '/foods/create', to: 'foods#create'
  post '/foods/destroy', to: 'foods#destroy'
  get '/inventories', to: 'inventories#index'
  post '/inventories/create', to: 'inventories#create'
  post '/inventories/destroy', to: 'inventories#destroy'
  get 'inventories/:inventory_id', to: 'inventories#show'
  get '/inventories/compare/:recipes_id/inventory_id', to: 'inventories#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
