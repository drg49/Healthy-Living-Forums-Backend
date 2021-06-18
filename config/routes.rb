Rails.application.routes.draw do
  
  resources :comments
  resources :posts
  get "/posts/topic/:topic", to: "posts#showtopic" 
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
