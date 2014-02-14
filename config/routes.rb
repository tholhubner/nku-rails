NkuRails::Application.routes.draw do
  get "welcome/index"
  resources :posts do
    resources :comments
  end
  
  ## routes for the Bueller Student Application
  resources :students, except: :edit
  resources :sessions

  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"
  
  root to: 'welcome#index'
end
