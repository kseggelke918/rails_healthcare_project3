Rails.application.routes.draw do
  get 'sessions/create'
  resources :hospitals
  resources :patients
  resources :doctors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'application#welcome'
end
