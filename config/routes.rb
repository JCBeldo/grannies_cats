Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/grannies", to: "grannies#index"
  get "/grannies/:id", to: "grannies#show"
end
