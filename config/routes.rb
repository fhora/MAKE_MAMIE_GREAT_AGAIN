Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # routes pour reviews dans page user
  resources :users, only: [] do
    resources :reviews, only: %i[new create]
  end

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "mymissions", to: "missions#myindex"
  get "mymissions_candidates", to: "missions#myindex_candidate"
  get "user/:id", to: "pages#user", as: :userpage

  resources :missions do
    resources :mission_candidates, only: %i[create update edit destroy]
  end
  resources :chatrooms, only: %i[create show index] do
    resources :messages, only: :create
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
