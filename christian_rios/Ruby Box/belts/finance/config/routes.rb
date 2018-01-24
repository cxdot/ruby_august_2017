Rails.application.routes.draw do
  resources :debitors, only: [:create, :index]
  resources :creditors, only: [:create, :index]
  root "application#index"

  post 'login' => 'sessions#create'

  post 'institutions/:id' => 'institutions#create'

  get 'register' => 'application#register'

  delete 'logout' => 'sessions#destroy'

end
