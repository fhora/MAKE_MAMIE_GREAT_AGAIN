Rails.application.routes.draw do
  get 'mission_candidate/new'
  get 'mission_candidate/create'
  get 'mission_candidate/update'
  get 'mission_candidate/edit'
  get 'mission_candidate/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
