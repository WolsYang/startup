Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "missions#index"
  #get "/new", to: redirect('/missions/new')
  #get "/add_uer", to: redirect('/missions/add_user')
  
  resources :missions do
    get :m_users, on: :member
	delete :rm_user, on: :member
	resources :users
  end
  resources :users do
	get :u_missions, on: :member
	delete :rm_mission, on: :member
  end	
end
