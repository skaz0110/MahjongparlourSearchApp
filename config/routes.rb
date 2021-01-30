Rails.application.routes.draw do
  devise_for :users
  post '/posts/guest_sign_in', to: 'posts#new_guest'
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  root 'posts#index'

end
