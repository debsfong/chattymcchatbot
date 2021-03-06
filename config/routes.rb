Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'registrations/controller'

  get 'registrations/new'

  get 'registrations/create'

  get 'messages/create'

  get 'chatrooms/index'

  get 'chatrooms/new'

  get 'chatrooms/edit'

  get 'chatrooms/create'

  get 'chatrooms/update'

  get 'chatrooms/show'

  root "welcome#about"

  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get 'users/:id', to: "users#show", as: "profile"

  resources :chatrooms, param: :slug
  resources :messages

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
