Incorporacion::Application.routes.draw do
  devise_for :users, controllers: {
    registrations:'users/registrations',
    invitations:  'users/invitations'
  }

  devise_for :candidates, controllers: {
    invitations: 'candidates/invitations'
  }

  devise_scope :user do
    get "signup", to: "users/registrations#new"
  end

  root to: "home#index"
  get 'users', to: 'users#index'
  resources :candidates do
    get 'invite', to: 'candidates#invite', as: :invite
    get 'training_programs', to: 'training_programs#index'
    get 'training_programs/:training_program_id/tasks', to:'task#index',
        as: :tasks
    resources :candidate_actions, path: 'actions'
  end

  resources :task do
    post 'complete', to:'tasks#complete'
  end
  resources :training_programs do
    resources :tasks
    resources :assign_training_program, as: :assign, path: 'assign'
  end
end
