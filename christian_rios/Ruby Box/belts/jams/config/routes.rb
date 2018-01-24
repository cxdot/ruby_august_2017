Rails.application.routes.draw do
  root 'application#index'

  resources :users, only: [:create, :show]
  resources :songs, only: [:index, :create, :show]

  post 'playlists' => 'playlists#create'

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '*path' => redirect('/')
end
