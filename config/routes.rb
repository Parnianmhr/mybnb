Rails.application.routes.draw do
  resources :themes
  root to: 'pages#home'
  get "about" => "pages#about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :bookings
  end

  resources :rooms do
    resources :bookings, only: [:show, :create]
  end
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  resources :photos
end
