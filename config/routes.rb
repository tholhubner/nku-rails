NkuRails::Application.routes.draw do
  get "students/index"
  resources :posts do
    resources :comments
  end
  
  ## routes for the Bueller Student Application
  resources :students, except: :edit
  resources :sessions
  resources :attendances
  resources :assignments

  delete "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"
  
  root to: 'students#index'
end
