Matcheese::Application.routes.draw do
  resources :emails

  #こっち優先
  get "users/oauth"
  get "users/callback"
  #検索ページ？
  match 'users/:id', :to => "users#index", :as => "index"

  post "users/update"
  resources :users
  root :to => "users#oauth"

  resources :likes
  get "likes/index"
end
