Breath::Application.routes.draw do
  devise_for :users
  get "welcome/about"
  get "welcome/launch"
  
  root "welcome#about"
end
