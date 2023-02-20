Rails.application.routes.draw do

  root to: "pages#home"
  get '/about-us', to: "pages#about_us"
  get '/sign-up', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  resources :users, except: [:new]
  resources :categories
  resources :blogs

end


# get 'sessions/new'
# get 'sessions/create'
# get 'users/new'
# get 'users/create'