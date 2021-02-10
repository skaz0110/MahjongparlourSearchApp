Rails.application.routes.draw do
  devise_for :users
  post  '/posts/guest_sign_in', to: 'posts#new_guest'
  resources :homes, only: [:index]
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:index,:create,:destroy,:edit,:update]
  end
  post    'like/:id' => 'likes#create',   as: 'create_like'
  delete  'like/:id' => 'likes#destroy',  as: 'destroy_like'
  get     'like/:id' => 'likes#index',    as: 'index_like'
  root                  'homes#index'
  
end
