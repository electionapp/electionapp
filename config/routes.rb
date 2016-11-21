Rails.application.routes.draw do
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

#Election routes
get "/user/:id/elections/new" => "elections#new", as: "new_election"
post "/user/:id/elections/new" => "elections#create", as: "submit_election"


get "/user/:id/elections" => "elections#index", as: "show_elections"
get "/user/:id/elections/:id" => "elections#show", as: "election"
get "/user/:id/elections/:id/edit" => "elections#edit", as: "edit_election"

# resources :users do
#   resources :elections do
#     resources :positions do
#       resources :candidates
#     end
#   end
# end


  # resources :positions do
  #   resources :candidates
  # end

  # resource :elections
  resource :positions
  resource :candidates
  # resource :elections do
  #     get "add_users"
  # end

  # resources :positions do
  #   member do
  #     post 'upvote'
  #   end
  # end

  # resources :elections do
  #   resources :positions
  # end

  # resources :users do
  #   resources :elections
  # end


  # resources :users
  # resources :candidates


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages, only: [:new]
end
