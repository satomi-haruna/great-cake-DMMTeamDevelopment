Rails.application.routes.draw do


  namespace :admin do
    get 'homes/top'
  end
  # namespace :public do
  #   get 'customers/show'
  # end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


   root to: "public/homes#top"
   get "about" => "public/homes#about"
   scope module: 'public' do
    #customersのrouting↓
      get 'customers/my_page' => 'customers#show'
      get 'customers/infomation/edit' => 'customers#edit'
      patch 'customers/infomation' => 'customers#update'
      get 'customers/unsubscribe' => 'customers#unsubscribe'
      patch 'customers/withdraw' => 'customers#withdraw'
      delete :cart_items, to: 'cart_items#destroy_all'
      get "orders/complete" => "orders#complete"
      post "orders/confirm" => "orders#confirm"
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :index, :create, :show]
      #get "addresses" => "public/addresses#index"
    resources :addresses, except: [:new, :show]
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, except: [:destroy]
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
