Rails.application.routes.draw do
root 'application#index'

resources :users, exclude: [:index]
resources :events
post 'events/:id/user' => 'meetups#create'
delete 'events/:id/user' => 'meetups#destroy'

post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'

post 'comments' => 'comments#create'
end
