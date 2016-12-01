Rails.application.routes.draw do
  root 'welcome#index'

resources :users do
  resources :elections do
    resources :positions do
      resources :candidates do
        member do
          post 'upvote'
        end
      end
    end
  end
end

  #****** CLEARANCE routes that have been redefined for our project structure  ******
  # Probably don't need to touch these
  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  #************************************************************

# base = "/user/:id/elections"
# #Election routes
# get "#{base}/new" => "elections#new", as: "new_election"
get "/user/:user_id/elections/:election_id/users" => "elections#show_users", as: "election_users"
get "/user/:user_id/elections/:election_id/users/add" => "elections#add_users", as: "add_users_to_election"
get "/user/:user_id/elections/:election_id/users/csv" => "elections#csv_users", as: "add_users_to_election_from_csv"
post "/user/:user_id/elections/:election_id/users/csv" => "elections#csv_users"
end
