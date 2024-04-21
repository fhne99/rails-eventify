Rails.application.routes.draw do
  devise_for :users
  #root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "events#index"

  resources :events do
    resources :comments, only: [:create, :update, :destroy]
    resources :ratings, only: [:create, :update, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :bookmarks, only: [:index]
  resources :ratings, only: [:index]
  resources :comments, only: [:index]

  resources :cart, only: [:show, :update, :destroy] do
    resources :cart_items, only: [:create, :update, :destroy]
  end

  # Autres routes personnalisées
  get 'my_events', to: 'events#my_events', as: 'my_events'
  get 'my_bookmarks', to: 'bookmarks#my_bookmarks', as: 'my_bookmarks'
  get 'my_ratings', to: 'ratings#my_ratings', as: 'my_ratings'
  get 'my_comments', to: 'comments#my_comments', as: 'my_comments'

end
