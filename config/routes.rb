Rails.application.routes.draw do
  root 'welcome#index'
  get 'getProject/:owner/:repo', to: 'projects#getProject'
  
  resources :commits
  resources :contributors
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
