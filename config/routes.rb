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
    resources :candidate_actions, path: 'actions', as: 'actions'
  end

  post 'task/:task_id/complete', to:'tasks#complete', as: 'task_complete'
  resources :training_programs do
    resources :assign_training_program, as: :assign, path: 'assign'
  end

  resources :training_programs, only: [:index, :show],
            controller: 'candidates/training_programs',
            as: 'my_training_programs',
            path: 'my_training_programs'
end
