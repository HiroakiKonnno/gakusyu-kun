Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete '/lessons/id/edit/task/id', to: 'lessons#destroy_task'

  resources :users do
    member do
      get 'edit_learner_info'
      patch 'update_learner_info'
    end
  end
  resources :lessons do
    member do
      get ''
end
