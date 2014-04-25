Breath::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: [:edit, :update]

  get "welcome/about"
  get "welcome/launch"
  
  root "welcome#about"
end
