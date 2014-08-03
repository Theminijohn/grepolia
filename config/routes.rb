Rails.application.routes.draw do

  # API
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :players, only: [:index, :show]
    end
  end

  # //
  root 'pages#home'

  # Resources
	resources :players, only: [:index, :show]

end