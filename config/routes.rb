Rails.application.routes.draw do
  resources :uploads
    resources :users
    post 'user_token' => 'user_token#create'
    post 'users/find' => 'users#find'
    post 'users/create', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
