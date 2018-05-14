Rails.application.routes.draw do

  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :admins, path: 'admins'
  # eg. http://localhost:3000/admins/sign_in

  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :bookings, only: [:create, :index], defaults: {format: :json}
        resources :vendors do
          collection do
            get :unapproved
          end
        end
        resources :marquees, defaults: {format: :json}
        resources :hall_managers, defaults: {format: :json}
        resources :decorators, defaults: {format: :json}
        resources :photographers, defaults: {format: :json}
        resources :registrations do
          member do
            post :image_change
            post :password_change
          end
          collection do
            post :social
          end
        end
        resource :sessions, only: [:create, :destroy], defaults: {format: :json}
      end
    end
  end
  resources :bookings
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
end
