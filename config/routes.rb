Rails.application.routes.draw do
  devise_for :users

  post '/posts/guest_sign_in', to: 'posts#new_guest'
 
  resources :homes
 
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  root 'posts#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
