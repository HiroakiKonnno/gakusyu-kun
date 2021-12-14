Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :show
      get :user_index
      get 'edit_learner_info'
      patch 'update_learner_info'
    end
  end
end
