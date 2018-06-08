Rails.application.routes.draw do
  use_doorkeeper

  get 'login' => 'sessions#new', as: :login
  root to: "users#index"

  resource :session, only: [ :create, :destroy ]

  resources :users

  scope :v1 do
    resources :users, only: [:index]
  end
end
