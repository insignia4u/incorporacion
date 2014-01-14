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
    resources :candidate_actions, path: 'actions'
  end
end
