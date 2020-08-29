Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :users, only: [:new, :create, :show]
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
