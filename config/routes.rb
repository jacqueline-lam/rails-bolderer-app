Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :show] do 
    resources :sends
    get 'sends/sort/easiest', to: 'sends#easiest'
    get '/sends/sort/hardest', to: 'sends#hardest'
  end 

  resources :problems, only: [:index, :show, :new, :create]
  resources :rewards, only: [:index, :show, :new, :create]

  get '/problems/sort/easiest', to: 'problems#easiest'
  get '/problems/sort/hardest', to: 'problems#hardest'
  get '/problems/filter/grades', to: 'problems#grades' # maybe
  get '/problems/filter/style', to: 'problems#style' # maybe
  get '/problems/filter/wall', to: 'problems#wall' # maybe

end
