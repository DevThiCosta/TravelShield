Rails.application.routes.draw do
devise_for :users
root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'pages/about' => 'pages#about'
  get 'pages/contact' => 'pages#contact'
  get 'pages/terms' => 'pages#terms'
  get 'pages/tips' => 'pages#tips'
  get 'pages/prices' => 'pages#prices'
  get '/profile_user/:id/info', to: 'profile_user#info', as: 'profile_user_info'
  get '/reviews/:id/info', to: 'reviews#show_info', as: 'reviews_info'
  get 'users/:id/reviews', to: 'reviews#user_reviews', as: 'user_reviews'

  resources :reviews
  resources :danger_areas
  resources :profile_user
  resources :cities
  resources :sights

  # Defines the root path route ("/")
  # root "posts#index"
end
