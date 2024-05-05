Rails.application.routes.draw do
  get "/pages/show"
  get "/sign_up", to: "registrations#new"
  post "/users", to: "registrations#create"
  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"
  delete "/sign_out", to: "sessions#destroy"

  resources :posts do
    resources :comments
  end

  root "posts#index"
end
