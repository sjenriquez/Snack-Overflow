Rails.application.routes.draw do
  root 'welcome#index'
  resources :noms, :comments

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user_show"
  get '/users/:id/edit', to: "users#edit", as: "user_edit"
  patch '/users/:id', to: "users#update", as: "user_update"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'logout'

  get 'votes/show', to: 'votes#show'
  post 'votes/create', to: 'votes#create'

end
