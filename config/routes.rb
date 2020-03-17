Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :users, :only => [:new, :create, :index, :show, :edit]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :posts
end
