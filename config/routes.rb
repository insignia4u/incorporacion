Incorporacion::Application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    get "signup", to: "users/registrations#new"
  end

  root to: "home#index"
  resources :candidates do
    resources :candidate_actions, path: 'actions'
  end
end
