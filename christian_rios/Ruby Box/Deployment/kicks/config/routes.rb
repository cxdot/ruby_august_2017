Rails.application.routes.draw do
  root 'application#index'
  
  post 'login' => 'sessions#create'
  
  delete 'logout' => 'sessions#destroy'
  
  resources :users, only: [:create, :show]
  resources :shoes, only: [:index]
end
