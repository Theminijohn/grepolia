Rails.application.routes.draw do

  # API
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :players, only: [:index, :show]
			resources :towns, only: [:index, :show]
	    resources :alliances, only: [:index, :show]
      resources :conquers, only: [:index, :show]
    end
  end

  # //
  root 'pages#home'

  # Devise 
  devise_for :users, path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # get '*path', to: 'pages#home'

  # Players 
	resources :players, only: [:index, :show] do
    member do
      get :follow
      get :unfollow
    end
  end

	resources :towns, only: [:index, :show]
	resources :alliances, only: [:index, :show]
  resources :conquers, only: [:index, :show]


  # Public Activity
  resources :activities
  get 'clear_activities' => 'activities#delete_all', as: :clear_activities

end
