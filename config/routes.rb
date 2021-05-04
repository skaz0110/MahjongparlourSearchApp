Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, :controllers => {
    # このpathを通して外部API認証が行われる。
    :omniauth_callbacks => 'users/omniauth_callbacks'
   }

  root  'homes#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  post  'like/:id' => 'likes#create',   as: 'create_like'
  resources :users, only: [:show]
  resources :likes, only: [:index,:destroy,:create]
  resources :homes, only: [:index]
  resources :posts do
    resources :reviews,   only: [:index,:create,:new,:destroy]
    resources :comments,  only: [:index,:create,:new]
  end

  resource :contacts, only: [:new, :create] do
    get "/thanks" => "contacts#thanks"
  end
  
  
  
end
