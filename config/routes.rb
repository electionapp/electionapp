Rails.application.routes.draw do
  root 'welcome#index'

resources :users do
  resources :elections do
    resources :positions do
      resources :candidates
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
end
