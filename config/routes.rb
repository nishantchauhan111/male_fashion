Rails.application.routes.draw do
  scope "(locales)", locale: /en|gu/ do
    get '/', to: 'homes#index'
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

   
    devise_for :users
    

    get :about, to: 'home#about'
    get :blogs, to: 'home#blog'
    resources :carts
    resources :checkouts
    resources :products
    resources :users
    resources :devise
  
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    # Defines the root path route ("/")
  end
  root "homes#index"  

end
