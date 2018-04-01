Rails.application.routes.draw do
  #google login---
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :tmpdatabasaes

  root to: "home#show"
  get 'home/show'

  get 'post/new'

  get '/post' => 'post#index'
  get 'post/:post_id' => 'post#view'


  get 'posts/post' => 'post#post'

  post 'post/create' => 'post#create'

  get 'like' => 'post#postlike'

  get "like/:post_id" => "post#like"
  get "unlike/:post_id" => "post#unlike"

  get 'black/:post_id' => 'post#black'
  get 'white/:post_id' => 'post#white'


########################
  #
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'main/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
