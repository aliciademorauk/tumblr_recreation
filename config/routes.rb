Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/posts/new", to: "posts#new", as: "new_post"
  post "/posts", to: "posts#create"
  
  root "posts#index"
end
