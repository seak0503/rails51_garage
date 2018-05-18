Rails.application.routes.draw do
  use_doorkeeper

  root to: "users#index"

  scope :v1 do
    resources :users, only: [:index]
  end
end
