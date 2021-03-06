Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :users, only: [:new, :index, :show, :create]

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/login', to: 'sessions#destroy'
end
