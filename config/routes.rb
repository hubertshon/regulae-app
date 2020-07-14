Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"


  namespace :api do
    get "/habits/:id" => "habits#show"
    post "/habits" => "habits#create"
    patch "/habits/:id" => "habits#update"
    delete "/habits/:id" => "habits#destroy"


    get "/categories" => "categories#index"
    get "/categories/:id" => "categories#show"
    post "/categories" => "categories#create"
    patch "/categories/:id" => "categories#update"
    delete "/categories/:id" => "categories#destroy"

    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#delete"

    get "/sessions" => "sessions#show"
    post "/sessions" => "sessions#create"
  end
end
