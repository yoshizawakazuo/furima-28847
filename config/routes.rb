Rails.application.routes.draw do
  
  get 'furima/index'
 root  "furima#index"
 
  resources :furima, only: [:index, :new, :create]
 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
end
