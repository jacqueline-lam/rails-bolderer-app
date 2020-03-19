Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  # Provide a route for :provider strategies to "call back" to
  # after the authenticating 3rd party decides whether the user has passed or failed authentication
  # handshake
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :show] do 
    resources :sends
    get '/sends/sort/easiest', to: 'sends#easiest', as: 'easiest_sends'
    get '/sends/sort/hardest', to: 'sends#hardest', as: 'hardest_sends'
    get '/sends/sort/favorites', to: 'sends#favorites', as: 'favorite_sends'
  end 

  resources :problems, only: [:index, :show, :new, :create]
  get '/problems/sort/easiest', to: 'problems#easiest', as: 'easiest_problems'
  get '/problems/sort/hardest', to: 'problems#hardest', as: 'hardest_problems'
  # get '/problems/filter/grades', to: 'problems#grades' # maybe
  # get '/problems/filter/style', to: 'problems#style' # maybe
  # get '/problems/filter/wall', to: 'problems#wall' # maybe
  resources :rewards, only: [:index, :show, :new, :create]
end
