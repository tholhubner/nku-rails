NkuRails::Application.routes.draw do
  get "welcome/index"
  resources :posts do
    resources :comments
  end
  
  ## route for the Bueller Student Application
  resources :students
  
  root to: 'welcome#index'
end
