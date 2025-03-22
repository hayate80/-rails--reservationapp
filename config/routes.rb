Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  get 'tops/index'
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile'
  post 'tops/search', to: 'tops#search'
  get 'tops/search', to: 'tops#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources 'rooms' do
  end
  root to: 'tops#index'
  resources 'reservations' do
    collection do
      post 'confirm'
    end
    member do
      post 'edit_confirm'
    end
  end
end
