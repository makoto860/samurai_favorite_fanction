Rails.application.routes.draw do
  get "webs/index"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end

  resource :users, only: [:edit, :update] do
  collection do
    get "cart", :to => "shopping_carts#index"
    post "cart/create", :to => "shopping_carts#create"
    get "mypage/index", :to => "users#index"
    get "mypage", :to => "users#mypage"
    get "mypage/edit", :to => "users#edit"
    post "mypage", :to => "users#update"
    get "mypage/address/edit", :to => "users#edit_address"
    delete "cart", :to => "shopping_carts#destroy"
    put "mypage", :to => "users#update"
    get "users/mypage", :to => "users#mypage"
    get "mypage/edit_password", :to =>"users#edit_password"
    put "mypage/password", :to => "users#update_password"
    get  "mypage/favorite", :to => "users#favorite"
  end
end

  resources :products do
   member do
     get :favorite
   end
    resources :reviews, only: [:create]
  end
end
