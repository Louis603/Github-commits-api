Rails.application.routes.draw do
  # Had to switch to using params this way because nodejs.org plugged into the repo params would show up as nodejs when the repo name actually ends with an .org
  get 'getProject', to: 'projects#getProject'
  # get 'getProject/:owner/:repo', to: 'projects#getProject'
  get 'projects/:proj/:user', to: 'projects#showUser'
  root 'welcome#index'
  resources :commits
  resources :contributors
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
