Rails.application.routes.draw do
  scope "(locales)", locale: /#{I18n.available_locales.join("|")}/do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "homes#index"
  devise_for :users
  

  

  resources :abouts
  resources :blogs
  resources :carts
  resources :checkouts
  resources :products
  resources :users
  resources :devise
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
end
