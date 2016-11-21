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

get "/user/:id/elections" => "election#index", as: "show_elections" 
get "/user/:id/election/new" => "election#create", as: "new_election"
post "/user/:id/election/new" => "election#create", as: "submit_new_election"

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
