Rails.application.routes.draw do

  get 'about', to: 'pages#about', as: 'about'

  get 'contact_us', to: 'pages#contact', as: 'contact'

  get 'home', to: 'pages#home', as: 'home'

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      post :remove_from_cart
    end
    collection do
      post :remove_all_from_cart
    end
  end

  # get 'products', to: 'products#index', as: 'products'
  #
  # get 'products/:id', to: 'products#show', as: 'product', id: /\d+/
  #
  # get 'products/table', to: 'products#table', as: 'table'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
