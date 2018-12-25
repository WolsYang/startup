Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "missions#index"
  get "/new", to: redirect('/missions/new')
  resources :missions
  resources :users
end
