Rails.application.routes.draw do
  root 'flashcards#index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :flashcards do
    member do
      patch :toggle
    end
    collection do
      get :learning
      get :review
    end
  end

end
