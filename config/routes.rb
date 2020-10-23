Rails.application.routes.draw do
  resources :menus 
  resources :dishes 
  resources :reservations, only: [:new, :create, :update, :edit, :show, :destroy]
  resources :restaurants, only: [:index, :show]
  resources :users, only: [:index, :new, :create, :update, :edit, :show]

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'

  post '/sessions/new_login', to: 'sessions#login'

end
