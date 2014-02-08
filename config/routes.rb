NkuRails::Application.routes.draw do
  get "welcome/index"
  resources :posts do
    resources :comments
  end
  
  ## routes for the Bueller Student Application
  resources :students
  resources :sessions
  
  get "signout" => "sessions#destroy", :as => "signout"
  get "signin" => "sessions#new", :as => "signin"
  
  root to: 'welcome#index'
end
