Rails.application.routes.draw do
  root 'static_pages#home'
  resources :groupings, only: %i[index new create]
  get 'groupings/external_index', to: 'groupings#external_index'
  resources :groups, only: %i[index new create show]

  get 'signup' => 'users#new'
  resources :users

  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :sessions
end
