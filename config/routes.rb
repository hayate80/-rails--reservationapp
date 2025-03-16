Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  get 'top/index'
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  root to: 'top#index'
  resources 'reservations' do
    collection do
      post 'confirm'
    end
  end
end
