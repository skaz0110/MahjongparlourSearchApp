Rails.application.routes.draw do
  devise_for :users

  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :posts
  resources :homes
  resources :comments
  root 'homes#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
