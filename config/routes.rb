Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "user/:id", to: "pages#user", as: :userpage

  resources :missions do
    resources :mission_candidates, only: %i[create update edit destroy]
  end

  # routes pour décliner et accepter candidats à la mission
  resources :mission_candidates, only: [] do
    member do
      patch :accepted
      patch :declined
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
