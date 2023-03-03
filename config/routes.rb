require 'sidekiq/web'
Rails.application.routes.draw do
  defaults format: :json do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }

    resource :users, only: %i[show update]
    resources :companies do
      collection do
        post :upload
      end
    end
  end

  # Sidekiq web config
  mount Sidekiq::Web => '/sidekiq'

  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  end
end
