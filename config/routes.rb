Rails.application.routes.draw do
  
  resources :comments
  resources :posts
  delete "/posts/destroyall/:id", to: "posts#destroyall"
  get "/posts/user/:author", to: "posts#userposts"
  get "/comments/post/:id", to: "comments#postcomments"
  get "/posts/topic/:topic", to: "posts#showtopic" 
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
