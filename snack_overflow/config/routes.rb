Rails.application.routes.draw do
  root 'welcome#index'

  resources :noms, :comments
  resources :tags, only: [:show, :create, :new, :index]


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

  get 'noms/:id/upvote', to: 'noms#upvote', as: 'nom_up'
  get 'noms/:id/downvote', to: 'noms#downvote', as: 'nom_down'

  get 'comment/:id/upvote', to: 'comments#upvote', as: 'comment_up'
  get 'comment/:id/downvote', to: 'comments#downvote', as: 'comment_down'

end
