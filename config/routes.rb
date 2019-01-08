Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "missions#index"
  get 'signup' => 'users#signup',:as => 'signup'
  get "login" => "users#login", :as => "login"                                        
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"
  
  resources :missions do
    get :m_users, on: :member
	post :add_user_to , on: :member 
	resources :rm_user, only: [:destroy], :controller => "missions", :action => "rm_user"
  end
  resources :users do
	get :u_missions, on: :member
	post :add_mission_to , on: :member 
	resources :rm_mission, only: [:destroy], :controller => "users", :action => "rm_mission"
  end	
end
