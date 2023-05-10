Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/grannies", to: "grannies#index"
  get "/grannies/:id", to: "grannies#show"
  get "grannies/:id/cats", to: "grannies/cats#index"

  get "/cats", to: "cats#index"
  get "/cats/:id", to: "cats#show"
end
