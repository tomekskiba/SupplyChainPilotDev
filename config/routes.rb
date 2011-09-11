SupplyChainPilot::Application.routes.draw do

  resources :orders
  match 'orders/confirmed/:id', :controller => 'orders', :action => 'confirmed'
  resources :order_ancillary_supply_xrefs
  resources :order_capd_supply_xrefs
  resources :order_apd_supply_xrefs
  resources :order_solution_xrefs
  resources :solutions
  resources :user_solution_xrefs
  resources :user_ancillary_supply_xrefs
  resources :user_capd_supply_xrefs
  resources :user_apd_supply_xrefs
  resources :apd_supplies
  resources :capd_supplies
  resources :ancillary_supplies

  #match "/users/sign_up" => "users#new"

  #match "/users" => "devise/sessions#new"

  scope "/admin" do
    resources :users
  end


  as :admin do
    get "admins/sign_out", :to => "devise/sessions#destroy"
    match "admin" => "devise/sessions#new"
  end
  devise_for :admins#, :controllers => {
                     #                 :registrations => "admins/registrations"
                      #                }


  as :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as=> :update_user_confirmation
    match "/" => "sessions#new"#, :as => :new_user_session, :via => :get
    #get "sign_in", :to => "devise/sessions#new"
    get "users/sign_out", :to => "devise/sessions#destroy"
    match "change_password" => "registrations#edit"
    #get "/" => "devise/sessions#new"
    #match "/users/sing_out" => "devise/sessions#new"
  end
  devise_for :users, #:path => "users", :path_names => { :sign_in => 'change' },
                     :controllers => {
                         :confirmations => "confirmations",
                                      :registrations => "registrations",
                                      :passwords     => "passwords",
                                      :sessions      => "sessions"
                          } do
    #get "/", :to => "devise/sessions#new", :as=> :new_user_session
    #root :to => "pages#home"
    #root :to => 'devise/sessions#new', :as=> :new_user_session
  end


  #root :to => 'devise/sessions#new'#, :as=> :new_user_session
  root :to => 'sessions#new'#, :as=> :new_user_session
end
