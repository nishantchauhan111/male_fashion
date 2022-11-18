Rails.application.routes.draw do
  scope "(locales)", locale: /en|gu/ do
    get '/', to: 'homes#index'
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)



    devise_for :users, :skip => [:sessions]
   

    # root paths
    
    root "home#index"
    
    get :about, to: 'homes#about'
    get :blogs, to: 'homes#blog'
    
    resources :users
    resources :categories, only: [:index, :show]  
    resources :products, only: [:index, :show]
    resources :carts, only: [:index, :create, :destroy, :update]
    resources :orders 
  end
end