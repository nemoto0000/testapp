Matcheese::Application.routes.draw do
  resources :emails

  #こっち優先
  get "users/index"
  get "users/oauth"
  post  "users/oauth"
  get "users/callback"
  match 'users/:id', :to => "users#index", :as => "index"

  post "users/update"
  resources :users
  root :to => "users#oauth" #users/indexの認証は無視して直で

  resources :likes
#  get "likes/index"
end
