Rails.application.routes.draw do
  get 'comments/new'
  root "pages#index"
  get '/login',to:"sessions#new"
  post'/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
  get 'favorites/new'
  post "/favorites",to:"favorites#create"
  delete "/favorites",to:"favorites#destroy"
  get 'pages/index'
  get 'pages/garally'
  get 'topics/myindex'
  resources :users
  resources :topics 
  resources :relationships, only: [:create, :delete]
  resources :topic do
    resources :comments, only: [:create,:delete]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
