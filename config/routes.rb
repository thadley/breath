Breath::Application.routes.draw do
  get "welcome/about"
  get "welcome/launch"
  
  root "welcome#about"
end
