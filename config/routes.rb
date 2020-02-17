Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}, path: 'auth'
  
  resources :users do 
    resources :patients
    resources :appointments
  end 

  resources :patients, only: [:index]
  
  root 'application#welcome'
  
end
