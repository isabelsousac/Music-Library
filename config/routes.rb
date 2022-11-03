Rails.application.routes.draw do
  root :to => "pages#home"
  get '/new_item' => 'pages#new_item'
  post '/new_item' => 'pages#create'

  resources :users, :only => [:new, :create, :index]
  
  resources :songs
  get '/dislike' => 'songs#dislike'
  get '/like/:id' => 'songs#like'
  get '/library_songs' => 'songs#library_songs'

  resources :albums

  resources :artists

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy'
end
