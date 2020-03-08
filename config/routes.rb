Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :show] do 
    resources :sends
  end 
  resources :problems, only: [:index, :show, :new, :create]
  # resources :walls, only: :create
  # resources :styles, only: :create
  # resources :problem_styles, only: :create
  resources :rewards, only: [:index, :show, :new, :create]
end
