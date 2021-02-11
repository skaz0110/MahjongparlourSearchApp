Rails.application.routes.draw do
  devise_for :users
  root  'homes#index'
  post  '/posts/guest_sign_in',         to: 'posts#new_guest'
  post  'like/:id' => 'likes#create',   as: 'create_like'
  resources :likes, only: [:index,:destroy]
  resources :homes, only: [:index]
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:index,:create,:destroy,:edit,:update]
  end
   
end
