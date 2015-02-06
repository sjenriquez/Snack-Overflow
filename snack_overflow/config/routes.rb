Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

end
