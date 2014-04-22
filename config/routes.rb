Breath::Application.routes.draw do
  devise_for :users
  get "welcome/about"
  get "welcome/launch"
  get "user/email"
  
  root "welcome#about"
end
