Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/search' => 'pages#search', :as => 'search_page'
  get '/recipes/user' => 'recipes#by_user', :as => 'user_recipe'
  post '/lists/add_recipe' => 'lists#add_recipe_to_list', :as => 'add_recipe'
  resources :users

  resources :lists

  resources :recipes do
    resources :comments
    resources :rates
  end

  resources :brands

  resources :comments
  resources :likes
  resources :ingredients
  resources :countrys

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
