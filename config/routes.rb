Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :users do
        get 'hall_manager/create'
      end
    end
  end

  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :admins, path: 'admins'
  # eg. http://localhost:3000/admins/sign_in

  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :hall_managers, defaults: {format: :json}
        resources :customers, defaults: {format: :json}
        resources :registrations, only: [:create], defaults: {format: :json}
        resources :sessions, only: [:create, :destroy], defaults: {format: :json}
        resources :vendors, defaults: {format: :json}
      end
    end
  end
  resources :homes
  resources :customers
  resources :vendors do
    collection do
      get :approved
      get :unapproved
    end
  end
  authenticated :admin do
    root :to => 'homes#index'
  end
  root 'homes#index'
  #authenticated :admin do
	#	root :to => 'homes#index'
	#end
  #root 'admin/ssessions#new'

  #devise_scope :admin do
  #  authenticated :admin do
  #    root 'homes#index', as: :authenticated_root
  #  end

  #  unauthenticated :admin do
  #    root 'devise/sessions#new', as: :unauthenticated_root
  #  end
  #end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
