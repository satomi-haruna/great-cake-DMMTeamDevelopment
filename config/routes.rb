Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:paswords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # root to: "public/homes#top"
  # namespace :public do
    get "home/about" => "home#about",as:'about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
      get 'customers/unsubscribe' => 'customers#unsubscribe'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
      delete :cart_items, to: 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :create, :show]
      post "orders/confirm" => "public/orders#confirm"
      get "ordes/complete" => "public/orders#complete"
    resources :addresses, skip: [:new, :show]
  # end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, skip: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    #get "admin/orders/:id" => "orders#show"
    #patch "admin/orders/:id" => "orders#update"
    #patch "admin/order_details/:id" => "order_details#update"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
