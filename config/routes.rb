Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users

  resources :lists

  resources :recipes

  resources :comments
  resources :likes
  resources :ingredients
  resources :countrys

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
