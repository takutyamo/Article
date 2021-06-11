Rails.application.routes.draw do
  get 'sessions/new'
  root 'gossips#index'
  resources :gossips do 
    resources :comments
  end
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  delete '/sign_out' => 'retirements#destroy'
end
