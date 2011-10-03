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

  scope "/admin" do
    resources :users
  end

  as :admin do
    get "admins/sign_out", :to => "devise/sessions#destroy"
    match "admin" => "devise/sessions#new"
  end
  devise_for :admins

  as :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as=> :update_user_confirmation
    match "/" => "sessions#new"
    get "users/sign_out", :to => "devise/sessions#destroy"
    match "change_password" => "registrations#edit"
  end
  devise_for :users, :controllers => {
                                      :confirmations => "confirmations",
                                      :registrations => "registrations",
                                      :passwords     => "passwords",
                                      :sessions      => "sessions"
                                     } do
  end

  root :to => 'sessions#new'
end
