Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}, path: 'auth'
  
  resources :users do 
    resources :patients
    resources :appointments
  end 

  resources :patients, only: [:index]
  
  root 'application#welcome'
  get 'user_profile', to: 'users#user_profile'
  get 'next_appointment', to: 'appointments#display_next_appointment'
  delete '/users/:user_id/patients/:id', to: 'patients#destroy', as: 'delete_patient'
  
end
