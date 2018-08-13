Rails.application.routes.draw do
  root 'pages#home'
  
  resources :users
  resources :projects
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end


 