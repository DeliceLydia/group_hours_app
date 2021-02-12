Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create]
  delete '/logout', to: 'sessions#destroy'
  resources :groupings, only: %i[index new create]
  resources :groups, only: %i[index new create show]
  
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'groupings/external_index', to: 'groupings#external_index'

end
