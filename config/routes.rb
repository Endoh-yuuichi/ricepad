Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'
  
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  get 'comments', to: 'comments#new'
  post 'comments', to: 'comments#create'

end
