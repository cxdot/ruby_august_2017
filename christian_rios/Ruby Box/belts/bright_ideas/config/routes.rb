Rails.application.routes.draw do
root 'application#index'

resources :users, only: [:index, :create, :show, :destroy]
resources :ideas, only: [:index, :create, :show, :destroy]

post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'

post 'likes' => 'likes#create'

get '*path' => redirect('/')
end