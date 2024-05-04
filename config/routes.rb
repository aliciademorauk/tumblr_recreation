Rails.application.routes.draw do
  get "pages/show"
  root "posts#index"
  resources :posts do
    resources :comments
  end
end
