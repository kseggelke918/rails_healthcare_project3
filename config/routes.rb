Rails.application.routes.draw do
  get 'sessions/create'
  # resources :patients
  resources :users do 
    resources :patients, only: [:index, :show, :new, :create, :destroy]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'application#welcome'
end
