Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new'

  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :events, only: [:new, :create, :show, :index]
end
