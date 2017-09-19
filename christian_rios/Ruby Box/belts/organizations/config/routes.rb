Rails.application.routes.draw do
  root 'application#index'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  delete 'groups/:id/user' => 'meetups#destroy'

  post 'groups/:id/user' => 'meetups#create'

  resources :users, only: [:create]
  resources :groups, only: [:index, :create, :show, :destroy]

  get '*path' => redirect('/')

end
