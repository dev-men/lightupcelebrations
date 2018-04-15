Rails.application.routes.draw do


  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :admins, path: 'admins'
  # eg. http://localhost:3000/admins/sign_in

  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :vendors, defaults: {format: :json}
        resources :marquees, defaults: {format: :json}
        resources :hall_managers, defaults: {format: :json}
        resources :decorators, defaults: {format: :json}
        resources :photographers, defaults: {format: :json}
        resources :registrations do
          member do
            post :image_change
            post :password_change
          end
        end
        resource :sessions, only: [:create, :destroy], defaults: {format: :json}
      end
    end
  end
  resources :homes
  resources :customers
  resources :vendors do
    collection do
      get :hall_managers
      get :unapproved_hall_managers
      get :photographers
      get :unapproved_photographers
      get :decorators
      get :unapproved_decorators
      get :marquee
      get :unapproved_marquee
    end
    member do
      get :approve_vendor
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
