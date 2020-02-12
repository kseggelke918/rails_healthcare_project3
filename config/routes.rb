Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  get 'sessions/create'
  # resources :patients
  resources :users do 
    resources :patients
  end 
  # root 'users#sign_up'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'application#welcome'
end
