Rails.application.routes.draw do
  # get 'pages/home'
  # get 'pages/about_us'

  
  resources :categories
  # root to: "blogs#index"
  root to: "pages#home"
  get '/about-us', to: "pages#about_us"

  resources :blogs


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "blogs#index"
end
