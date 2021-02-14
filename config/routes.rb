Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root  'homes#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  post  'like/:id' => 'likes#create',   as: 'create_like'
  resources :users, only: [:show]
  resources :likes, only: [:index,:destroy]
  resources :homes, only: [:index]
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:index,:create,:destroy,:edit,:update]
  end
   
end
