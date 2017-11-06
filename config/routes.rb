Rails.application.routes.draw do

  get 'products', to: 'products#index', as: 'products'

  get 'products/:id', to: 'products#show', as: 'product', id: /\d+/

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
