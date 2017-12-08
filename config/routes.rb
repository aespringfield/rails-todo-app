Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tasks#index"

  put "/tasks/:id/toggle_complete", to: "tasks#toggle_complete", as: "toggle_complete_task"
  get "/tasks/completed", to: "tasks#completed", as: "completed_tasks"

  resources :tasks
end
