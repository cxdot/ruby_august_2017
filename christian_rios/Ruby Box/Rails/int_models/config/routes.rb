Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/total' => 'users#total'
  get 'users/new' => 'users#new'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users' => 'users#create'
  patch 'edit/:id' => 'users#edit_user'

end
