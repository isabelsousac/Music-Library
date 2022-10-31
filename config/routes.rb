Rails.application.routes.draw do
  root :to => "pages#home"
  get '/new_item' => 'pages#new_item'
  post '/new_item' => 'pages#create'

  resources :users, :only => [:new, :create, :index]
  
  resources :users do
    resources :songs
  end

  resources :users do
    resources :albums, :only => [:show, :index]
  end

  resources :users do
    resources :artists
  end

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy'
end
