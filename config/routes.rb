Rails.application.routes.draw do
  config = Rails.application.config.garage

  constraints host: config[:staff][:host] do
    scope :staff do
      use_doorkeeper do
        controllers applications: 'api_applications'
        skip_controllers :authorized_applications, :token_info
      end
    end

    namespace :staff, path: config[:staff][:path] do
      namespace :api do
        namespace :v1 do
          resources :users
        end
      end
      get 'login' => 'sessions#new', as: :login
      root to: "users#index"
      #use_doorkeeper do
      #  controllers applications: 'api_applications'
      #  skip_controllers :authorized_applications, :authorizations, :tokens, :token_info
      #end
      resource :session, only: [ :create, :destroy ]
      resources :users
    end
  end

  constraints host: config[:account][:host] do
    scope :account do
      use_doorkeeper do
        skip_controllers :applications, :authorized_applications, :token_info
      end
    end

    namespace :account, path: config[:account][:path] do
      get 'login' => 'sessions#new', as: :login
      root to: "users#index"
      resource :session, only: [ :create, :destroy ]
      resources :users
    end
  end
end
