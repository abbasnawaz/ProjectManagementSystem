Rails.application.routes.draw do
  root "project#index"
  devise_for :newusers, controllers: {
    registrations: 'newuser/registrations'

  }

  resources :developer

  resources :project do
    resources :task, shallow: true
  end






  # get "/user/:id", to: "project#index"
  # get "/add_project", to: "project#create"
  # post "/add_project", to: "project#AddProject"

  # get "/edit_project/:id", to: "project#update_user_project"
  # post "/edit_project/:id", to: "project#save_user_project"


  # get "/delete_project/:id", to: "project#delete_user_project"

  # get "/project_task/:id", to: "task#show_task", as: :user_project

  # get "/add_task", to: "task#add_task"

  # post "/add_task", to: "task#save_task"


  # get "/edit_task/:id", to: "task#show_edit_task"
  # post "/edit_task/:id", to: "task#save_edit_task"


  # get "/delete_task/:id", to: "task#delete_task"



  # get "/developer/all", to: "developer#show_developer", as: :user_developer


  # get "/create_developer", to: "developer#create_developer"

  # post "/create_developer", to: "developer#save_developer"
end
