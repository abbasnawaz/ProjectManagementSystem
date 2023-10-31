Rails.application.routes.draw do
  devise_for :newusers, controllers: {
    registrations: 'newuser/registrations',

  }
  # do
    # root to: "devise/sessions#new"
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: "sessions#new"
  # root 'devise/registrations#sign_up'

  root "user#index"


  get "/user/:id", to: "user#projects"

  # get "/add_user", to: "user#addUser"

  # post "/add_user", to: "user#SaveUser"


  # get "/delete/:id",  to: "user#DeleteUser"

  # get "/edit_user/:id", to: "user#EditUser"

  # post "/update_user/:id", to: "user#UpdateUser"


end
