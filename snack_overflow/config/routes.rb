Rails.application.routes.draw do

  resources :noms, :comments

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "show"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  get 'votes/show', to: 'votes#show'
  post 'votes/create', to: 'votes#create'

end
