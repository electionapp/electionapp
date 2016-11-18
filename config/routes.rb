Rails.application.routes.draw do

  resources :positions do
    resources :candidates
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

# get "/user/:id/elections" => "elections#index" 
# get "/user/:id/election/new" => "elections#create"
# post "/user/:id/election/new" => "election#create", as: "new_election"

  resource :elections do
      get "add_users"
  end

  resources :positions do
    member do
      post 'upvote'
    end
  end

  resources :elections do
    resources :positions
  end

  resources :users do
    resources :elections
  end


    resources :users

  
  resources :candidates
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages, only: [:new]
end
