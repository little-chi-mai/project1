Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/search' => 'pages#search', :as => 'search_page'
  resources :users

  resources :lists

  resources :recipes do
    resources :comments
    resources :brands
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
