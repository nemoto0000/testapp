Matcheese::Application.routes.draw do
  #こっち優先
  post "users/index"
  get "users/oauth"
  get "users/callback"
  match 'users/:id', :to => "users#index", :as => "index"

  post "users/update"
  resources :users
  root :to => "users#oauth" #users/indexの認証は無視して直で

end
