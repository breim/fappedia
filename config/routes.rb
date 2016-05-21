Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: { format: :json }, path: '/api/' do
    namespace :v1 do
      resources :photos
    end
  end

end
