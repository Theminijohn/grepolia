Rails.application.routes.draw do

  resources :conquers

  # API
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :players, only: [:index, :show]
			resources :towns, only: [:index, :show]
	    resources :alliances, only: [:index, :show]
    end
  end

  # //
  root 'pages#home'

  # Resources
	resources :players, only: [:index, :show]
	resources :towns, only: [:index, :show]
	resources :alliances, only: [:index, :show]

end
