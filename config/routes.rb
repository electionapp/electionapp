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

# ********* Ordering matters in this file ********
# base = "/user/:id/elections"
# #Election routes
# get "#{base}/new" => "elections#new", as: "new_election"
# post "#{base}/new" => "elections#create", as: "submit_election"
# get "#{base}" => "elections#index", as: "show_elections"
# get "#{base}/:id" => "elections#show", as: "election"
# get "/#{base}/:id/edit" => "elections#edit", as: "edit_election"
# post "#{base}/:id/edit" => "elections#update", as: "update_election"

# get "#{base}/:id/positions" => "positions#index", as: "show_positions"
# get "#{base}/:id/postions/new" => "positions#new", as: "new_position"
# post "#{base}/:id/positions/new" => "positions#create", as: "submit_position"
#  # resource :positions
#   resource :candidates
resources :users do
  resources :elections do
    resources :positions do
      resources :candidates
    end
  end
end


  # resources :positions do
  #   resources :candidates
  # end

  # resource :elections
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
