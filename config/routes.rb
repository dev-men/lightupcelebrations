Rails.application.routes.draw do
  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :admins, path: 'admins'
  # eg. http://localhost:3000/admins/sign_in

  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :customers
        resources :registrations, only: [:create]
        resources :sessions, only: [:create, :destroy]
        resources :vendors
      end
    end
  end
  resources :homes
  #authenticated :admin do
	#	root :to => 'homes#index'
	#end
  #root 'admin/ssessions#new'

  devise_scope :admin do
    authenticated :admin do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated :admin do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
