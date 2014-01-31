NkuRails::Application.routes.draw do
  get "welcome/index"
  resources :posts do
    resources :comments
  end
  
  resources :buellers
  
  root to: 'welcome#index'
end
