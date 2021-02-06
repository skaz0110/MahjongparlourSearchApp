Rails.application.routes.draw do
  devise_for :users
  post  '/posts/guest_sign_in', to: 'posts#new_guest'
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:index,:create,:destroy,:edit,:update]
  end
  post    'like/:id' => 'likes#create',   as: 'create_like'
  delete  'like/:id' => 'likes#destroy',  as: 'destroy_like'
  root                  'posts#index'
  
end
