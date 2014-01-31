NkuRails::Application.routes.draw do
  get "welcome/index"
  resources :posts do
    resources :comments
  end
  
  resources :bueller
  
  root to: 'welcome#index'
end
