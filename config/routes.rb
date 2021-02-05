Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create]
  
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  delete 'logout'  => 'sessions#destroy'
end
