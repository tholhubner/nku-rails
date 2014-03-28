NkuRails::Application.routes.draw do
  get "students/index"
  
  resources :students do
    collection { post :upload_page }
  end
  
  ## routes for the Bueller Student Application
  resources :students, except: :edit
  resources :sessions
  resources :attendances
  resources :assignments

  delete "sign_out", to: "sessions#destroy"
  get 'signin' => 'sessions#new'
  get "profile", to: "students#edit"
  get "upload_page" => "students#upload_page", via: "post"
  
  root to: 'students#index'
end
