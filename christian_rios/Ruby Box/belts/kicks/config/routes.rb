Rails.application.routes.draw do
  root 'application#index'
  
  post 'login' => 'sessions#create'
  
  delete 'logout' => 'sessions#destroy'
  
  post 'buy/:id' => 'transactions#create'

  resources :users, only: [:create, :show]
  resources :shoes, only: [:index, :create, :destroy]

  get '*path' => redirect('/')

end
